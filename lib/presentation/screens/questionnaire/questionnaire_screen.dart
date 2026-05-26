import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/questionnaire_provider.dart';
import '../../widgets/async_error_view.dart';

class QuestionnaireScreen extends ConsumerStatefulWidget {
  const QuestionnaireScreen({super.key, required this.projectId});

  final int projectId;

  @override
  ConsumerState<QuestionnaireScreen> createState() =>
      _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends ConsumerState<QuestionnaireScreen> {
  final _controllers = List.generate(
    questionnaireQuestions.length,
    (_) => TextEditingController(),
  );
  int _step = 0;

  @override
  void initState() {
    super.initState();
    for (final controller in _controllers) {
      controller.addListener(_onAnswerChanged);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.removeListener(_onAnswerChanged);
      controller.dispose();
    }
    super.dispose();
  }

  void _onAnswerChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    ref.listen(questionnaireControllerProvider(widget.projectId), (
      previous,
      next,
    ) {
      final response = next.valueOrNull;
      if (response == null) {
        return;
      }
      final decoded = jsonDecode(response.answersJson);
      if (decoded is Map<String, dynamic>) {
        for (var i = 0; i < questionnaireQuestions.length; i++) {
          final answer = decoded[questionnaireQuestions[i]]?.toString() ?? '';
          if (_controllers[i].text != answer) {
            _controllers[i].text = answer;
          }
        }
      }
    });
    final questionnaireState =
        ref.watch(questionnaireControllerProvider(widget.projectId));
    final isLast = _step == questionnaireQuestions.length - 1;
    final currentAnswer = _controllers[_step].text.trim();
    return Scaffold(
      appBar: AppBar(title: const Text('Questionnaire')),
      body: SafeArea(
        child: questionnaireState.when(
          data: (_) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Step ${_step + 1} of ${questionnaireQuestions.length}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: (_step + 1) / questionnaireQuestions.length,
              ),
              const SizedBox(height: 24),
              Text(
                questionnaireQuestions[_step],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controllers[_step],
                minLines: 5,
                maxLines: 10,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Answer',
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _step == 0
                          ? null
                          : () => setState(() => _step--),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: currentAnswer.isEmpty
                          ? null
                          : isLast
                              ? _save
                              : () => setState(() => _step++),
                      child: Text(isLast ? 'Save' : 'Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => AsyncErrorView(
            error: error,
            onRetry: () => ref
                .read(questionnaireControllerProvider(widget.projectId).notifier)
                .load(),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    await ref
        .read(questionnaireControllerProvider(widget.projectId).notifier)
        .saveAnswers(
          _controllers.map((controller) => controller.text.trim()).toList(),
        );
    if (mounted &&
        !ref.read(questionnaireControllerProvider(widget.projectId)).hasError) {
      Navigator.of(context).pop();
    }
  }
}

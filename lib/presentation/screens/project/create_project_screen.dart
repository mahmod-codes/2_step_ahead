import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/project_provider.dart';
import '../../widgets/form_section.dart';
import '../questionnaire/questionnaire_screen.dart';

class CreateProjectScreen extends ConsumerStatefulWidget {
  const CreateProjectScreen({super.key, required this.userId});

  final int userId;

  @override
  ConsumerState<CreateProjectScreen> createState() =>
      _CreateProjectScreenState();
}

class _CreateProjectScreenState extends ConsumerState<CreateProjectScreen> {
  final _titleController = TextEditingController();
  final _rawIdeaController = TextEditingController();
  String? _titleError;

  @override
  void dispose() {
    _titleController.dispose();
    _rawIdeaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createProjectControllerProvider);
    ref.listen(createProjectControllerProvider, (previous, next) {
      final projectId = next.valueOrNull;
      if (projectId == null || previous?.valueOrNull == projectId) {
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => QuestionnaireScreen(projectId: projectId),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Create project')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FormSection(
              label: 'Title',
              child: TextField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(errorText: _titleError),
              ),
            ),
            const SizedBox(height: 16),
            FormSection(
              label: 'Raw idea',
              child: TextField(
                controller: _rawIdeaController,
                minLines: 6,
                maxLines: 12,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: createState.isLoading ? null : _save,
              child: createState.isLoading
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save and answer questionnaire'),
            ),
            if (createState.hasError) ...[
              const SizedBox(height: 16),
              Text(
                createState.error.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      setState(() => _titleError = 'Title is required.');
      return;
    }
    setState(() => _titleError = null);
    await ref.read(createProjectControllerProvider.notifier).create(
          userId: widget.userId,
          title: title,
          rawIdea: _rawIdeaController.text.trim(),
        );
  }
}

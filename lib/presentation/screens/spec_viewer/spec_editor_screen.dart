import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/json_parser.dart';
import '../../../domain/entities/generated_spec.dart';
import '../../providers/app_providers.dart';
import '../../widgets/form_section.dart';

class SpecEditorScreen extends ConsumerStatefulWidget {
  const SpecEditorScreen({super.key, required this.spec});

  final GeneratedSpec spec;

  @override
  ConsumerState<SpecEditorScreen> createState() => _SpecEditorScreenState();
}

class _SpecEditorScreenState extends ConsumerState<SpecEditorScreen> {
  late final TextEditingController _controller;
  String? _error;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.spec.contentJson);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit v${widget.spec.version}')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FormSection(
              label: 'Spec JSON',
              child: TextField(
                controller: _controller,
                minLines: 18,
                maxLines: 28,
                style: AppTextStyles.specContent.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(errorText: _error),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save as new version'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final parsed = parseSpecJson(_controller.text);
      if (!hasRequiredSpecFields(parsed)) {
        setState(() => _error = 'Incomplete spec generated. Please retry.');
        return;
      }
      await ref.read(updateSpecUseCaseProvider)(
            projectId: widget.spec.projectId,
            contentJson: _controller.text,
          );
      ref.invalidate(specHistoryProvider(widget.spec.projectId));
      ref.invalidate(latestSpecProvider(widget.spec.projectId));
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'AI returned invalid format. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }
}

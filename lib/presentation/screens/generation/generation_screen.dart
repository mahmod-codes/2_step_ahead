import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/services/gemini_errors.dart';
import '../../../domain/entities/project.dart';
import '../../providers/app_providers.dart';
import '../../providers/generation_provider.dart';
import '../../widgets/api_key_dialog.dart';
import '../../widgets/status_badge.dart';
import '../questionnaire/questionnaire_screen.dart';
import '../spec_viewer/spec_viewer_screen.dart';
import '../spec_viewer/version_history_screen.dart';

class GenerationScreen extends ConsumerWidget {
  const GenerationScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generationState = ref.watch(generationControllerProvider);
    final latestSpec = ref.watch(latestSpecProvider(project.id));
    ref.listen(generationControllerProvider, (previous, next) {
      if (!next.hasError || next.isLoading) {
        return;
      }
      final error = next.error;
      if (error is GeminiMissingKeyException) {
        ensureGeminiApiKey(context, ref);
        return;
      }
      final message = switch (error) {
        GeminiInvalidJsonException() =>
          'AI returned invalid format. Please try again.',
        GeminiIncompleteSchemaException() =>
          'Incomplete spec generated. Please retry.',
        GeminiRateLimitException() =>
          'Gemini rate limit reached. Please retry later.',
        GeminiNetworkException(:final message) => message,
        _ => 'Failed to generate specification. Please retry.',
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () => _generate(context, ref),
          ),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        StatusBadge(status: project.status),
                      ],
                    ),
                    if ((project.rawIdea ?? '').isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(project.rawIdea!),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: generationState.isLoading
                  ? null
                  : () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              QuestionnaireScreen(projectId: project.id),
                        ),
                      ),
              icon: const Icon(Icons.checklist),
              label: const Text('Questionnaire'),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed:
                  generationState.isLoading ? null : () => _generate(context, ref),
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Generate Spec'),
            ),
            if (generationState.isLoading) ...[
              const SizedBox(height: 24),
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 12),
              const Center(
                child: Text('Generating technical specification...'),
              ),
            ],
            const SizedBox(height: 12),
            latestSpec.when(
              data: (spec) => spec == null
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SpecViewerScreen(spec: spec),
                            ),
                          ),
                          icon: const Icon(Icons.article_outlined),
                          label: Text('View latest spec v${spec.version}'),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => VersionHistoryScreen(
                                projectId: project.id,
                              ),
                            ),
                          ),
                          icon: const Icon(Icons.history),
                          label: const Text('Version history'),
                        ),
                      ],
                    ),
              loading: () => const SizedBox.shrink(),
              error: (error, stackTrace) => Text(error.toString()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generate(BuildContext context, WidgetRef ref) async {
    final hasKey = await ensureGeminiApiKey(context, ref);
    if (!hasKey) {
      return;
    }
    await ref.read(generationControllerProvider.notifier).generate(project);
  }
}

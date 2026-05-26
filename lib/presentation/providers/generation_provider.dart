import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/gemini_errors.dart';
import '../../domain/entities/project.dart';
import 'app_providers.dart';
import 'project_provider.dart';

class GenerationController extends StateNotifier<AsyncValue<void>> {
  GenerationController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> generate(Project project) async {
    state = const AsyncLoading();
    try {
      final response =
          await ref.read(repositoryProvider).getResponseByProjectId(project.id);
      if (response == null) {
        throw GeminiIncompleteSchemaException();
      }
      await ref.read(generateSpecUseCaseProvider)(
            projectId: project.id,
            rawIdea: project.rawIdea ?? '',
            questionnaireJson: response.answersJson,
          );
      ref.invalidate(specHistoryProvider(project.id));
      ref.invalidate(latestSpecProvider(project.id));
      ref.invalidate(projectsProvider(project.userId));
      await ref
          .read(projectListControllerProvider(project.userId).notifier)
          .loadProjects(project.userId);
      state = const AsyncData(null);
    } on Object catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

final generationControllerProvider =
    StateNotifierProvider<GenerationController, AsyncValue<void>>((ref) {
  return GenerationController(ref);
});

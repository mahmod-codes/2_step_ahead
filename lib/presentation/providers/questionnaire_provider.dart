import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/questionnaire_response.dart';
import 'app_providers.dart';

const questionnaireQuestions = [
  'What problem does this solve?',
  'Who are the target users?',
  'What is the preferred tech stack?',
  'What are the must-have features?',
  'Any specific constraints?',
];

class QuestionnaireActions {
  const QuestionnaireActions(this.ref);

  final Ref ref;

  Future<void> save(int projectId, List<String> answers) async {
    final payload = <String, String>{
      for (var i = 0; i < questionnaireQuestions.length; i++)
        questionnaireQuestions[i]: answers[i],
    };
    await ref.read(saveQuestionnaireUseCaseProvider)(
          projectId,
          const JsonEncoder.withIndent('  ').convert(payload),
        );
    ref.invalidate(questionnaireProvider(projectId));
  }
}

final questionnaireActionsProvider = Provider<QuestionnaireActions>((ref) {
  return QuestionnaireActions(ref);
});

class QuestionnaireController
    extends StateNotifier<AsyncValue<QuestionnaireResponse?>> {
  QuestionnaireController(this.ref, this.projectId)
      : super(const AsyncValue.loading()) {
    load();
  }

  final Ref ref;
  final int projectId;

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final response =
          await ref.read(repositoryProvider).getResponseByProjectId(projectId);
      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> saveAnswers(List<String> answers) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(questionnaireActionsProvider).save(projectId, answers);
      final response =
          await ref.read(repositoryProvider).getResponseByProjectId(projectId);
      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final questionnaireControllerProvider = StateNotifierProvider.family<
    QuestionnaireController,
    AsyncValue<QuestionnaireResponse?>,
    int>((ref, projectId) {
  return QuestionnaireController(ref, projectId);
});

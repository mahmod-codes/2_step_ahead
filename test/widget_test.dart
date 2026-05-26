import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/project.dart';
import 'package:flutter_application_1/domain/entities/questionnaire_response.dart';
import 'package:flutter_application_1/presentation/providers/project_provider.dart';
import 'package:flutter_application_1/presentation/providers/questionnaire_provider.dart';
import 'package:flutter_application_1/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_application_1/presentation/screens/questionnaire/questionnaire_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testDashboardShowsProjectCards', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          projectListControllerProvider(1).overrideWith(
            (ref) => _LoadedProjectListController(ref),
          ),
        ],
        child: const MaterialApp(home: DashboardScreen(localUserId: 1)),
      ),
    );
    await tester.pump();

    expect(find.text('Spec Tool'), findsOneWidget);
    expect(find.text('pending'), findsOneWidget);
  });

  testWidgets('testQuestionnaireNextButtonDisabledWhenFieldEmpty', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          questionnaireControllerProvider(1).overrideWith(
            (ref) => _LoadedQuestionnaireController(ref),
          ),
        ],
        child: const MaterialApp(home: QuestionnaireScreen(projectId: 1)),
      ),
    );
    await tester.pump();

    final nextButton = tester.widget<FilledButton>(find.widgetWithText(FilledButton, 'Next'));
    expect(nextButton.onPressed, isNull);
  });
}

class _LoadedProjectListController extends ProjectListController {
  _LoadedProjectListController(super.ref) {
    state = const AsyncValue.data([
      Project(
        id: 1,
        userId: 1,
        title: 'Spec Tool',
        status: 'pending',
        createdAt: 1,
      ),
    ]);
  }

  @override
  Future<void> loadProjects(int userId) async {}
}

class _LoadedQuestionnaireController extends QuestionnaireController {
  _LoadedQuestionnaireController(Ref ref) : super(ref, 1) {
    state = const AsyncValue.data(null);
  }

  @override
  Future<void> load() async {
    state = const AsyncValue<QuestionnaireResponse?>.data(null);
  }
}

import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/questionnaire_table.dart';

part 'questionnaire_dao.g.dart';

@DriftAccessor(tables: [QuestionnaireResponsesTable])
class QuestionnaireDao extends DatabaseAccessor<AppDatabase>
    with _$QuestionnaireDaoMixin {
  QuestionnaireDao(super.db);

  Future<int> insertOrUpdateResponse(int projectId, String answersJson) {
    final companion = QuestionnaireResponsesTableCompanion.insert(
      projectId: projectId,
      answersJson: answersJson,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    return into(questionnaireResponsesTable).insert(
      companion,
      onConflict: DoUpdate(
        (_) => companion,
        target: [questionnaireResponsesTable.projectId],
      ),
    );
  }

  Future<QuestionnaireResponsesTableData?> getResponseByProjectId(
    int projectId,
  ) {
    return (select(questionnaireResponsesTable)
          ..where((table) => table.projectId.equals(projectId)))
        .getSingleOrNull();
  }
}

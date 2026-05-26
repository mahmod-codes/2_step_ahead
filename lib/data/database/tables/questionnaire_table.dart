import 'package:drift/drift.dart';

import 'projects_table.dart';

class QuestionnaireResponsesTable extends Table {
  @override
  String get tableName => 'questionnaire_responses_table';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().unique().references(ProjectsTable, #id)();
  TextColumn get answersJson => text()();
  IntColumn get updatedAt => integer()();
}

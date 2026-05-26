import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/project_dao.dart';
import 'daos/questionnaire_dao.dart';
import 'daos/spec_dao.dart';
import 'tables/projects_table.dart';
import 'tables/questionnaire_table.dart';
import 'tables/specs_table.dart';
import 'tables/users_table.dart';

part 'app_database.g.dart';

const projectStatusPending = 'pending';
const projectStatusGenerating = 'generating';
const projectStatusCompleted = 'completed';
const allowedProjectStatuses = {
  projectStatusPending,
  projectStatusGenerating,
  projectStatusCompleted,
};

@DriftDatabase(
  tables: [
    UsersTable,
    ProjectsTable,
    QuestionnaireResponsesTable,
    GeneratedSpecsTable,
  ],
  daos: [ProjectDao, SpecDao, QuestionnaireDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, '2step_aheaad.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dao.dart';

// ignore_for_file: type=lint
mixin _$ProjectDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $ProjectsTableTable get projectsTable => attachedDatabase.projectsTable;
  $QuestionnaireResponsesTableTable get questionnaireResponsesTable =>
      attachedDatabase.questionnaireResponsesTable;
  $GeneratedSpecsTableTable get generatedSpecsTable =>
      attachedDatabase.generatedSpecsTable;
  ProjectDaoManager get managers => ProjectDaoManager(this);
}

class ProjectDaoManager {
  final _$ProjectDaoMixin _db;
  ProjectDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$ProjectsTableTableTableManager get projectsTable =>
      $$ProjectsTableTableTableManager(_db.attachedDatabase, _db.projectsTable);
  $$QuestionnaireResponsesTableTableTableManager
  get questionnaireResponsesTable =>
      $$QuestionnaireResponsesTableTableTableManager(
        _db.attachedDatabase,
        _db.questionnaireResponsesTable,
      );
  $$GeneratedSpecsTableTableTableManager get generatedSpecsTable =>
      $$GeneratedSpecsTableTableTableManager(
        _db.attachedDatabase,
        _db.generatedSpecsTable,
      );
}

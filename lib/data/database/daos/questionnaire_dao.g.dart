// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_dao.dart';

// ignore_for_file: type=lint
mixin _$QuestionnaireDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $ProjectsTableTable get projectsTable => attachedDatabase.projectsTable;
  $QuestionnaireResponsesTableTable get questionnaireResponsesTable =>
      attachedDatabase.questionnaireResponsesTable;
  QuestionnaireDaoManager get managers => QuestionnaireDaoManager(this);
}

class QuestionnaireDaoManager {
  final _$QuestionnaireDaoMixin _db;
  QuestionnaireDaoManager(this._db);
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
}

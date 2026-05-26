// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spec_dao.dart';

// ignore_for_file: type=lint
mixin _$SpecDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $ProjectsTableTable get projectsTable => attachedDatabase.projectsTable;
  $GeneratedSpecsTableTable get generatedSpecsTable =>
      attachedDatabase.generatedSpecsTable;
  SpecDaoManager get managers => SpecDaoManager(this);
}

class SpecDaoManager {
  final _$SpecDaoMixin _db;
  SpecDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$ProjectsTableTableTableManager get projectsTable =>
      $$ProjectsTableTableTableManager(_db.attachedDatabase, _db.projectsTable);
  $$GeneratedSpecsTableTableTableManager get generatedSpecsTable =>
      $$GeneratedSpecsTableTableTableManager(
        _db.attachedDatabase,
        _db.generatedSpecsTable,
      );
}

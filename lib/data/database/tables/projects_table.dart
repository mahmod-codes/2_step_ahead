import 'package:drift/drift.dart';

import 'users_table.dart';

class ProjectsTable extends Table {
  @override
  String get tableName => 'projects_table';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(UsersTable, #id)();
  TextColumn get title => text()();
  TextColumn get rawIdea => text().nullable()();
  TextColumn get status => text()();
  IntColumn get createdAt => integer()();
}

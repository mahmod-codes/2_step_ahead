import 'package:drift/drift.dart';

import 'projects_table.dart';

class GeneratedSpecsTable extends Table {
  @override
  String get tableName => 'generated_specs_table';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().references(ProjectsTable, #id)();
  IntColumn get version => integer()();
  TextColumn get contentJson => text()();
  IntColumn get createdAt => integer()();
}

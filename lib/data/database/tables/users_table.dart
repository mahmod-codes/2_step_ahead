import 'package:drift/drift.dart';

class UsersTable extends Table {
  @override
  String get tableName => 'users_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get firebaseUid => text().unique()();
  TextColumn get email => text()();
  IntColumn get createdAt => integer()();
}

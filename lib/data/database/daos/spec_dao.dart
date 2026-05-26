import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/specs_table.dart';

part 'spec_dao.g.dart';

@DriftAccessor(tables: [GeneratedSpecsTable])
class SpecDao extends DatabaseAccessor<AppDatabase> with _$SpecDaoMixin {
  SpecDao(super.db);

  Future<int> insertSpec({
    required int projectId,
    required String contentJson,
  }) async {
    final latest = await getLatestSpecForProject(projectId);
    final nextVersion = (latest?.version ?? 0) + 1;
    return into(generatedSpecsTable).insert(
      GeneratedSpecsTableCompanion.insert(
        projectId: projectId,
        version: nextVersion,
        contentJson: contentJson,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<List<GeneratedSpecsTableData>> getSpecsByProjectId(int projectId) {
    return (select(generatedSpecsTable)
          ..where((table) => table.projectId.equals(projectId))
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.version,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }

  Future<GeneratedSpecsTableData?> getLatestSpecForProject(int projectId) {
    return (select(generatedSpecsTable)
          ..where((table) => table.projectId.equals(projectId))
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.version,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(1))
        .getSingleOrNull();
  }
}

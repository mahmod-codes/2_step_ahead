import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/projects_table.dart';
import '../tables/questionnaire_table.dart';
import '../tables/specs_table.dart';
import '../tables/users_table.dart';

part 'project_dao.g.dart';

@DriftAccessor(
  tables: [
    UsersTable,
    ProjectsTable,
    QuestionnaireResponsesTable,
    GeneratedSpecsTable,
  ],
)
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  ProjectDao(super.db);

  Future<int> insertUserIfMissing({
    required String firebaseUid,
    required String email,
  }) async {
    final existing = await (select(usersTable)
          ..where((table) => table.firebaseUid.equals(firebaseUid)))
        .getSingleOrNull();
    if (existing != null) {
      return existing.id;
    }
    return into(usersTable).insert(
      UsersTableCompanion.insert(
        firebaseUid: firebaseUid,
        email: email,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<UsersTableData> getUserByFirebaseUid(String firebaseUid) {
    return (select(usersTable)
          ..where((table) => table.firebaseUid.equals(firebaseUid)))
        .getSingle();
  }

  Future<int> insertProject({
    required int userId,
    required String title,
    String? rawIdea,
  }) {
    return into(projectsTable).insert(
      ProjectsTableCompanion.insert(
        userId: userId,
        title: title,
        rawIdea: Value(rawIdea),
        status: projectStatusPending,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<List<ProjectsTableData>> getAllProjectsForUser(int userId) {
    return (select(projectsTable)
          ..where((table) => table.userId.equals(userId))
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.createdAt,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }

  Future<void> updateProjectStatus(int projectId, String status) {
    if (!allowedProjectStatuses.contains(status)) {
      throw ArgumentError.value(status, 'status', 'Invalid project status');
    }
    return (update(projectsTable)..where((table) => table.id.equals(projectId)))
        .write(ProjectsTableCompanion(status: Value(status)));
  }

  Future<void> deleteProject(int projectId) {
    return transaction(() async {
      await (delete(generatedSpecsTable)
            ..where((table) => table.projectId.equals(projectId)))
          .go();
      await (delete(questionnaireResponsesTable)
            ..where((table) => table.projectId.equals(projectId)))
          .go();
      await (delete(projectsTable)..where((table) => table.id.equals(projectId)))
          .go();
    });
  }
}

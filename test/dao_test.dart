import 'package:drift/native.dart';
import 'package:flutter_application_1/data/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  Future<int> insertUser(String uid) {
    return database.projectDao.insertUserIfMissing(
      firebaseUid: uid,
      email: '$uid@example.com',
    );
  }

  test('testInsertAndRetrieveProject', () async {
    final userId = await insertUser('u1');

    await database.projectDao.insertProject(
      userId: userId,
      title: 'Planner',
      rawIdea: 'Study planning app',
    );

    final projects = await database.projectDao.getAllProjectsForUser(userId);
    expect(projects, hasLength(1));
    expect(projects.single.title, 'Planner');
    expect(projects.single.status, projectStatusPending);
  });

  test('testGetAllProjectsForUserReturnsOnlyOwnedProjects', () async {
    final user1 = await insertUser('u1');
    final user2 = await insertUser('u2');
    await database.projectDao.insertProject(userId: user1, title: 'Mine');
    await database.projectDao.insertProject(userId: user2, title: 'Theirs');

    final projects = await database.projectDao.getAllProjectsForUser(user1);

    expect(projects, hasLength(1));
    expect(projects.single.title, 'Mine');
  });

  test('testInsertSpecIncrementsVersion', () async {
    final userId = await insertUser('u1');
    final projectId =
        await database.projectDao.insertProject(userId: userId, title: 'Spec');

    await database.specDao.insertSpec(projectId: projectId, contentJson: '{}');
    await database.specDao.insertSpec(projectId: projectId, contentJson: '{}');

    final specs = await database.specDao.getSpecsByProjectId(projectId);
    expect(specs.map((spec) => spec.version), [2, 1]);
  });

  test('testQuestionnaireInsertOrUpdateOverwritesExisting', () async {
    final userId = await insertUser('u1');
    final projectId =
        await database.projectDao.insertProject(userId: userId, title: 'Q');

    await database.questionnaireDao.insertOrUpdateResponse(projectId, '{"a":1}');
    await database.questionnaireDao.insertOrUpdateResponse(projectId, '{"a":2}');

    final response =
        await database.questionnaireDao.getResponseByProjectId(projectId);
    expect(response!.answersJson, '{"a":2}');
  });
}

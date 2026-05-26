import 'dart:convert';

import '../../core/utils/json_parser.dart';
import '../../domain/entities/generated_spec.dart' as domain;
import '../../domain/entities/project.dart' as domain;
import '../../domain/entities/questionnaire_response.dart' as domain;
import '../../domain/usecases/create_project.dart';
import '../../domain/usecases/generate_spec.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_spec_history.dart';
import '../../domain/usecases/save_questionnaire.dart';
import '../../domain/usecases/update_spec.dart';
import '../database/app_database.dart' as db;
import 'gemini_service.dart';

class LocalAppRepository
    implements
        CreateProjectRepository,
        GetProjectsRepository,
        SaveQuestionnaireRepository,
        GenerateSpecRepository,
        GetSpecHistoryRepository,
        UpdateSpecRepository {
  LocalAppRepository(this.database, this.geminiService);

  final db.AppDatabase database;
  final GeminiService geminiService;

  Future<int> insertUserIfMissing({
    required String firebaseUid,
    required String email,
  }) {
    return database.projectDao.insertUserIfMissing(
      firebaseUid: firebaseUid,
      email: email,
    );
  }

  Future<db.UsersTableData> getUserByFirebaseUid(String firebaseUid) {
    return database.projectDao.getUserByFirebaseUid(firebaseUid);
  }

  @override
  Future<int> insertProject({
    required int userId,
    required String title,
    String? rawIdea,
  }) {
    return database.projectDao.insertProject(
      userId: userId,
      title: title,
      rawIdea: rawIdea,
    );
  }

  @override
  Future<List<domain.Project>> getAllProjectsForUser(int userId) async {
    final rows = await database.projectDao.getAllProjectsForUser(userId);
    return rows.map(_projectFromRow).toList();
  }

  Future<void> updateProjectStatus(int projectId, String status) {
    return database.projectDao.updateProjectStatus(projectId, status);
  }

  Future<void> deleteProject(int projectId) {
    return database.projectDao.deleteProject(projectId);
  }

  @override
  Future<int> insertOrUpdateResponse(int projectId, String answersJson) {
    return database.questionnaireDao.insertOrUpdateResponse(
      projectId,
      answersJson,
    );
  }

  Future<domain.QuestionnaireResponse?> getResponseByProjectId(
    int projectId,
  ) async {
    final row = await database.questionnaireDao.getResponseByProjectId(projectId);
    if (row == null) {
      return null;
    }
    return domain.QuestionnaireResponse(
      id: row.id,
      projectId: row.projectId,
      answersJson: row.answersJson,
      updatedAt: row.updatedAt,
    );
  }

  @override
  Future<String> generateSpec({
    required int projectId,
    required String rawIdea,
    required String questionnaireJson,
  }) async {
    await database.projectDao.updateProjectStatus(
      projectId,
      db.projectStatusGenerating,
    );
    try {
      final parsed = await geminiService.generateSpec(
        rawIdea: rawIdea,
        questionnaireJson: questionnaireJson,
      );
      final encoded = const JsonEncoder.withIndent('  ').convert(parsed);
      await database.specDao.insertSpec(
        projectId: projectId,
        contentJson: encoded,
      );
      await database.projectDao.updateProjectStatus(
        projectId,
        db.projectStatusCompleted,
      );
      return encoded;
    } on Object {
      await database.projectDao.updateProjectStatus(
        projectId,
        db.projectStatusPending,
      );
      rethrow;
    }
  }

  @override
  Future<int> insertSpec({
    required int projectId,
    required String contentJson,
  }) {
    parseSpecJson(contentJson);
    return database.specDao.insertSpec(
      projectId: projectId,
      contentJson: prettyJson(contentJson),
    );
  }

  @override
  Future<List<domain.GeneratedSpec>> getSpecsByProjectId(int projectId) async {
    final rows = await database.specDao.getSpecsByProjectId(projectId);
    return rows.map(_specFromRow).toList();
  }

  Future<domain.GeneratedSpec?> getLatestSpecForProject(int projectId) async {
    final row = await database.specDao.getLatestSpecForProject(projectId);
    if (row == null) {
      return null;
    }
    return _specFromRow(row);
  }

  domain.Project _projectFromRow(db.ProjectsTableData row) {
    return domain.Project(
      id: row.id,
      userId: row.userId,
      title: row.title,
      rawIdea: row.rawIdea,
      status: row.status,
      createdAt: row.createdAt,
    );
  }

  domain.GeneratedSpec _specFromRow(db.GeneratedSpecsTableData row) {
    return domain.GeneratedSpec(
      id: row.id,
      projectId: row.projectId,
      version: row.version,
      contentJson: row.contentJson,
      createdAt: row.createdAt,
    );
  }
}

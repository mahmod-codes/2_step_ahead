import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/database/app_database.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/gemini_service.dart';
import '../../data/services/local_app_repository.dart';
import '../../domain/entities/generated_spec.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/questionnaire_response.dart';
import '../../domain/usecases/create_project.dart';
import '../../domain/usecases/generate_spec.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_spec_history.dart';
import '../../domain/usecases/save_questionnaire.dart';
import '../../domain/usecases/update_spec.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(firebase.FirebaseAuth.instance);
});

final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService(ref.watch(secureStorageProvider));
});

final repositoryProvider = Provider<LocalAppRepository>((ref) {
  return LocalAppRepository(
    ref.watch(databaseProvider),
    ref.watch(geminiServiceProvider),
  );
});

final createProjectUseCaseProvider = Provider<CreateProject>((ref) {
  return CreateProject(ref.watch(repositoryProvider));
});

final getProjectsUseCaseProvider = Provider<GetProjects>((ref) {
  return GetProjects(ref.watch(repositoryProvider));
});

final saveQuestionnaireUseCaseProvider = Provider<SaveQuestionnaire>((ref) {
  return SaveQuestionnaire(ref.watch(repositoryProvider));
});

final generateSpecUseCaseProvider = Provider<GenerateSpec>((ref) {
  return GenerateSpec(ref.watch(repositoryProvider));
});

final getSpecHistoryUseCaseProvider = Provider<GetSpecHistory>((ref) {
  return GetSpecHistory(ref.watch(repositoryProvider));
});

final updateSpecUseCaseProvider = Provider<UpdateSpec>((ref) {
  return UpdateSpec(ref.watch(repositoryProvider));
});

final firebaseUserProvider = StreamProvider<firebase.User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});

final localUserProvider = FutureProvider<UsersTableData?>((ref) async {
  final firebaseUser = await ref.watch(firebaseUserProvider.future);
  if (firebaseUser == null) {
    return null;
  }
  final repository = ref.watch(repositoryProvider);
  await repository.insertUserIfMissing(
    firebaseUid: firebaseUser.uid,
    email: firebaseUser.email ?? '',
  );
  return repository.getUserByFirebaseUid(firebaseUser.uid);
});

final projectsProvider = FutureProvider.family<List<Project>, int>((
  ref,
  userId,
) async {
  try {
    return ref.watch(getProjectsUseCaseProvider)(userId);
  } catch (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
});

final questionnaireProvider =
    FutureProvider.family<QuestionnaireResponse?, int>((ref, projectId) {
  return ref.watch(repositoryProvider).getResponseByProjectId(projectId);
});

final specHistoryProvider =
    FutureProvider.family<List<GeneratedSpec>, int>((ref, projectId) {
  return ref.watch(getSpecHistoryUseCaseProvider)(projectId);
});

final latestSpecProvider = FutureProvider.family<GeneratedSpec?, int>((
  ref,
  projectId,
) {
  return ref.watch(repositoryProvider).getLatestSpecForProject(projectId);
});

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController(this._storage) : super(ThemeMode.dark) {
    _load();
  }

  static const _themeKey = 'theme_mode';

  final FlutterSecureStorage _storage;

  Future<void> _load() async {
    final value = await _storage.read(key: _themeKey);
    state = value == 'light' ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _storage.write(
      key: _themeKey,
      value: state == ThemeMode.light ? 'light' : 'dark',
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  return ThemeController(ref.watch(secureStorageProvider));
});

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import '../../domain/entities/project.dart';
import 'app_providers.dart';

class ProjectListController
    extends StateNotifier<AsyncValue<List<Project>>> {
  ProjectListController(this.ref) : super(const AsyncValue.loading());

  final Ref ref;

  Future<void> loadProjects(int userId) async {
    state = const AsyncValue.loading();
    try {
      final projects = await ref.read(getProjectsUseCaseProvider)(userId);
      state = AsyncValue.data(projects);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final projectListControllerProvider = StateNotifierProvider.family<
    ProjectListController, AsyncValue<List<Project>>, int>((ref, userId) {
  final controller = ProjectListController(ref);
  unawaited(controller.loadProjects(userId));
  return controller;
});

class SearchQueryController extends StateNotifier<String> {
  SearchQueryController() : super('');

  Timer? _timer;

  void setQuery(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 300), () {
      state = value;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final searchQueryProvider =
    StateNotifierProvider<SearchQueryController, String>((ref) {
  return SearchQueryController();
});

final filteredProjectsProvider =
    Provider.family<AsyncValue<List<Project>>, int>((ref, userId) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  final projects = ref.watch(projectListControllerProvider(userId));
  return projects.whenData((items) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((project) => project.title.toLowerCase().contains(query))
        .toList();
  });
});

class CreateProjectController extends StateNotifier<AsyncValue<int?>> {
  CreateProjectController(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> create({
    required int userId,
    required String title,
    String? rawIdea,
  }) async {
    state = const AsyncValue.loading();
    try {
      final id = await ref.read(createProjectUseCaseProvider)(
            userId: userId,
            title: title,
            rawIdea: rawIdea,
          );
      ref.invalidate(projectsProvider(userId));
      await ref
          .read(projectListControllerProvider(userId).notifier)
          .loadProjects(userId);
      state = AsyncValue.data(id);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final createProjectControllerProvider =
    StateNotifierProvider<CreateProjectController, AsyncValue<int?>>((ref) {
  return CreateProjectController(ref);
});

class ProjectActions {
  const ProjectActions(this.ref);

  final Ref ref;

  Future<int> create({
    required int userId,
    required String title,
    String? rawIdea,
  }) async {
    try {
      final id = await ref.read(createProjectUseCaseProvider)(
            userId: userId,
            title: title,
            rawIdea: rawIdea,
          );
      ref.invalidate(projectsProvider(userId));
      await ref
          .read(projectListControllerProvider(userId).notifier)
          .loadProjects(userId);
      return id;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> delete(int userId, int projectId) async {
    await ref.read(repositoryProvider).deleteProject(projectId);
    ref.invalidate(projectsProvider(userId));
    await ref
        .read(projectListControllerProvider(userId).notifier)
        .loadProjects(userId);
  }

  Future<void> markPending(int projectId) {
    return ref
        .read(repositoryProvider)
        .updateProjectStatus(projectId, projectStatusPending);
  }
}

final projectActionsProvider = Provider<ProjectActions>((ref) {
  return ProjectActions(ref);
});

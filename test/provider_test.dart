import 'package:flutter_application_1/domain/entities/project.dart';
import 'package:flutter_application_1/domain/usecases/get_projects.dart';
import 'package:flutter_application_1/presentation/providers/app_providers.dart';
import 'package:flutter_application_1/presentation/providers/project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testProjectProviderLoadsProjectsAndEmitsAsyncData', () async {
    final container = ProviderContainer(
      overrides: [
        getProjectsUseCaseProvider.overrideWithValue(
          GetProjects(_FakeGetProjectsRepository()),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container
        .read(projectListControllerProvider(1).notifier)
        .loadProjects(1);

    final state = container.read(projectListControllerProvider(1));
    expect(state.hasValue, isTrue);
    expect(state.value, hasLength(1));
  });

  test('testProjectProviderEmitsAsyncErrorOnDaoFailure', () async {
    final container = ProviderContainer(
      overrides: [
        getProjectsUseCaseProvider.overrideWithValue(
          GetProjects(_FailingGetProjectsRepository()),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container
        .read(projectListControllerProvider(1).notifier)
        .loadProjects(1);

    final state = container.read(projectListControllerProvider(1));
    expect(state.hasError, isTrue);
  });
}

class _FakeGetProjectsRepository implements GetProjectsRepository {
  @override
  Future<List<Project>> getAllProjectsForUser(int userId) async {
    return [
      const Project(
        id: 1,
        userId: 1,
        title: 'Spec Tool',
        status: 'pending',
        createdAt: 1,
      ),
    ];
  }
}

class _FailingGetProjectsRepository implements GetProjectsRepository {
  @override
  Future<List<Project>> getAllProjectsForUser(int userId) {
    throw StateError('db failed');
  }
}

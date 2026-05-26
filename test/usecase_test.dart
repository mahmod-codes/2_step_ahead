import 'package:flutter_application_1/domain/entities/generated_spec.dart';
import 'package:flutter_application_1/domain/usecases/create_project.dart';
import 'package:flutter_application_1/domain/usecases/generate_spec.dart';
import 'package:flutter_application_1/domain/usecases/get_spec_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testCreateProjectUseCaseCallsDao', () async {
    final repo = _FakeCreateProjectRepository();
    final useCase = CreateProject(repo);

    final id = await useCase(userId: 7, title: 'App', rawIdea: 'Idea');

    expect(id, 42);
    expect(repo.called, isTrue);
  });

  test('testGenerateSpecUseCaseCallsGeminiAndDao', () async {
    final repo = _FakeGenerateSpecRepository();
    final useCase = GenerateSpec(repo);

    final result = await useCase(
      projectId: 1,
      rawIdea: 'Idea',
      questionnaireJson: '{}',
    );

    expect(result, '{"overview":{}}');
    expect(repo.called, isTrue);
  });

  test('testGetSpecHistoryReturnsSortedByVersion', () async {
    final useCase = GetSpecHistory(_FakeSpecHistoryRepository());

    final specs = await useCase(1);

    expect(specs.map((spec) => spec.version), [3, 2, 1]);
  });
}

class _FakeCreateProjectRepository implements CreateProjectRepository {
  bool called = false;

  @override
  Future<int> insertProject({
    required int userId,
    required String title,
    String? rawIdea,
  }) async {
    called = true;
    return 42;
  }
}

class _FakeGenerateSpecRepository implements GenerateSpecRepository {
  bool called = false;

  @override
  Future<String> generateSpec({
    required int projectId,
    required String rawIdea,
    required String questionnaireJson,
  }) async {
    called = true;
    return '{"overview":{}}';
  }
}

class _FakeSpecHistoryRepository implements GetSpecHistoryRepository {
  @override
  Future<List<GeneratedSpec>> getSpecsByProjectId(int projectId) async {
    return [
      const GeneratedSpec(id: 3, projectId: 1, version: 3, contentJson: '{}', createdAt: 3),
      const GeneratedSpec(id: 2, projectId: 1, version: 2, contentJson: '{}', createdAt: 2),
      const GeneratedSpec(id: 1, projectId: 1, version: 1, contentJson: '{}', createdAt: 1),
    ];
  }
}

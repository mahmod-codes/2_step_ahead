import '../entities/generated_spec.dart';

abstract class GetSpecHistoryRepository {
  Future<List<GeneratedSpec>> getSpecsByProjectId(int projectId);
}

class GetSpecHistory {
  const GetSpecHistory(this.repository);

  final GetSpecHistoryRepository repository;

  Future<List<GeneratedSpec>> call(int projectId) {
    return repository.getSpecsByProjectId(projectId);
  }
}

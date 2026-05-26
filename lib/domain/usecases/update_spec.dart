abstract class UpdateSpecRepository {
  Future<int> insertSpec({required int projectId, required String contentJson});
}

class UpdateSpec {
  const UpdateSpec(this.repository);

  final UpdateSpecRepository repository;

  Future<int> call({required int projectId, required String contentJson}) {
    return repository.insertSpec(projectId: projectId, contentJson: contentJson);
  }
}

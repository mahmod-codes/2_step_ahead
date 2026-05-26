abstract class CreateProjectRepository {
  Future<int> insertProject({
    required int userId,
    required String title,
    String? rawIdea,
  });
}

class CreateProject {
  const CreateProject(this.repository);

  final CreateProjectRepository repository;

  Future<int> call({
    required int userId,
    required String title,
    String? rawIdea,
  }) {
    return repository.insertProject(
      userId: userId,
      title: title,
      rawIdea: rawIdea,
    );
  }
}

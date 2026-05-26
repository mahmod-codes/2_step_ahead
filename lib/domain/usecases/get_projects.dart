import '../entities/project.dart';

abstract class GetProjectsRepository {
  Future<List<Project>> getAllProjectsForUser(int userId);
}

class GetProjects {
  const GetProjects(this.repository);

  final GetProjectsRepository repository;

  Future<List<Project>> call(int userId) {
    return repository.getAllProjectsForUser(userId);
  }
}

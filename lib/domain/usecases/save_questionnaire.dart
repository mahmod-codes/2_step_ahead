abstract class SaveQuestionnaireRepository {
  Future<int> insertOrUpdateResponse(int projectId, String answersJson);
}

class SaveQuestionnaire {
  const SaveQuestionnaire(this.repository);

  final SaveQuestionnaireRepository repository;

  Future<int> call(int projectId, String answersJson) {
    return repository.insertOrUpdateResponse(projectId, answersJson);
  }
}

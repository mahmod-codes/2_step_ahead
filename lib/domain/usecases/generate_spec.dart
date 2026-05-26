abstract class GenerateSpecRepository {
  Future<String> generateSpec({
    required int projectId,
    required String rawIdea,
    required String questionnaireJson,
  });
}

class GenerateSpec {
  const GenerateSpec(this.repository);

  final GenerateSpecRepository repository;

  Future<String> call({
    required int projectId,
    required String rawIdea,
    required String questionnaireJson,
  }) {
    return repository.generateSpec(
      projectId: projectId,
      rawIdea: rawIdea,
      questionnaireJson: questionnaireJson,
    );
  }
}

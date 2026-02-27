import 'package:my_vocability/features/vocab/domain/repository/vocabulary_repository.dart';

class VocabularyUseCase {
  final VocabularyRepository repository;

  VocabularyUseCase(this.repository);

  Future getPhoneTicByWord(String word) async {
    return repository.findPhoneTicByWord(word);
  }
}

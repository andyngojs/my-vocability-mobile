import 'package:my_vocability/features/vocab/domain/repository/vocabulary_repository.dart';

class VocabularyUseCase {
  final VocabularyRepository repository;

  VocabularyUseCase(this.repository);

  Future getPhoneTicByWord(String word) async {
    print('object');
    return repository.findPhoneTicByWord(word);
  }
}
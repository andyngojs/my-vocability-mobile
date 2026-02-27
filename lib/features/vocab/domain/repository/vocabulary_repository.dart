import '../../data/datasource/vocabulary_datasource.dart';

class VocabularyRepository {
  late final VocabularyDataSource dataSource;

  VocabularyRepository(this.dataSource);

  void findPhoneTicByWord(String word) {
    dataSource.fetchWordPhoneTic(word);
  }
}

import 'package:my_vocability/features/vocab/data/datasource/vocabulary_datasource.dart';

import '../../domain/repository/vocabulary_repository.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  late final VocabularyDataSource dataSource;

  VocabularyRepositoryImpl(this.dataSource);


}
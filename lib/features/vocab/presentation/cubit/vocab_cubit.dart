import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/vocabulary.dart';

class VocabularyState {
  final List<Vocabulary> words;
  final bool isLoading = false;

  VocabularyState({this.words = const []});

  VocabularyState copyWith({List<Vocabulary>? words}) {
    return VocabularyState(words: words ?? this.words);
  }
}

class VocabCubit extends Cubit<VocabularyState> {
  VocabCubit() : super(VocabularyState());

  void increment() => {
    print("increment in cubit")
  };

  void addWord(Vocabulary word) {
    final newList = List<Vocabulary>.from(state.words)..add(word);
    emit(state.copyWith(words: newList));
  }
}

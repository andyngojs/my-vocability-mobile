import 'package:flutter_bloc/flutter_bloc.dart';

class FlashcardCubit extends Cubit<int> {
  FlashcardCubit() : super(0);

  void increment() => {
    print("increment in cubit"),
    emit(state + 1)
  };
  void decrement() => emit(state - 1);
}

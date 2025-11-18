import 'package:flutter_bloc/flutter_bloc.dart';

class VocabCubit extends Cubit<int> {
  VocabCubit() : super(0);

  void increment() => {
    print("increment in cubit"),
    emit(state + 1)
  };
  void decrement() => emit(state - 1);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_vocability/features/flashcard/presentation/cubit/flashcard_cubit.dart';

class FlashcardPage extends StatefulWidget {
  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  Widget build(BuildContext context) {
    return BlocBuilder<FlashcardCubit, int>(
      builder: (_ctx, state) =>
          SafeArea(child: Scaffold(body: Text("FlashCard page"))),
    );
  }
}

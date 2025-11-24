import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_vocability/features/flashcard/presentation/cubit/flashcard_cubit.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashcardCubit, int>(
      builder: (_ctx, state) => SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text('Good morning, Dong Ngo', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text('Streak ')
              )
            ],
          ),
        ),
      ),
    );
  }
}

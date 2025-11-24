import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_vocability/features/vocab/presentation/cubit/vocab_cubit.dart';

import 'package:my_vocability/features/vocab/presentation/widgets/add_word_dialog.dart';

class VocabPage extends StatefulWidget {
  const VocabPage({super.key});

  @override
  State<VocabPage> createState() => _VocabPageState();
}

class _VocabPageState extends State<VocabPage> {

  void showAddNewWordDialog(BuildContext context) async {
    await showDialog(context: context, builder: (_) => AddWordDialog());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VocabCubit, VocabularyState>(
      builder: (_context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Vocabulary'), centerTitle: false),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => showAddNewWordDialog(context),
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blueGrey)),
                    child: Text('Create new word'),
                  ),
                ),
              ),

              Text('Vocab Page'),
            ],
          ),
        ),
      ),
    );
  }
}

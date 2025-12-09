import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_vocability/features/vocab/domain/entities/vocabulary.dart';
import 'package:my_vocability/features/vocab/presentation/cubit/vocab_cubit.dart';

import 'package:my_vocability/features/vocab/presentation/widgets/add_word_dialog.dart';

class VocabPage extends StatefulWidget {
  const VocabPage({super.key});

  @override
  State<VocabPage> createState() => _VocabPageState();
}

class _VocabPageState extends State<VocabPage> {
  void handleAddNewWord(String newWord, String meaning, String wordType) {
    final vocabulary = Vocabulary(
      name: newWord,
      meaning: meaning,
      wordType: wordType,
      phonetic: '',
    );
    context.read<VocabCubit>().addWord(vocabulary);
  }

  void showAddNewWordDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => AddWordDialog(
        onAddWord: (String newWord, String meaning, String wordType) =>
            handleAddNewWord(newWord, meaning, wordType),
      ),
    );
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
                    onPressed: () => showAddNewWordDialog(_context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                    ),
                    child: Text('Create new word'),
                  ),
                ),
              ),

              SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: state.words.length,
                  itemBuilder: (context, index) {
                    final vocab = state.words[index];
                    return ListTile(
                      title: Text(vocab.name),
                      subtitle: Text(vocab.meaning),
                      trailing: Text(vocab.wordType),
                      titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
                      subtitleTextStyle: TextStyle(fontSize: 12, color: Colors.black87, ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

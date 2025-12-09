import 'package:flutter/material.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key, required this.onAddWord});

  final Function(String, String, String) onAddWord;

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final _newWordController = TextEditingController();
  final _meaningController = TextEditingController();

  String _selectedPartOfSpeech = '';
  final List<String> _options = [
    'Noun',
    'Verb',
    'Adjective',
    'Adverb',
    'Preposition',
    'Conjunction',
    'Interjection',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Word',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),

                IconButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _newWordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('new vocabulary'),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _meaningController,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Meaning Vietnamese'),
              ),
            ),

            const SizedBox(height: 12),

            DropdownMenu(
              label: Text('Part of Speech'),
              width: double.infinity,
              initialSelection: _selectedPartOfSpeech,
              onSelected: (String? value) {
                setState(() {
                  if (value != null) {
                    _selectedPartOfSpeech = value;
                  } else {
                    _selectedPartOfSpeech = _options[0];
                  }
                });
              },
              dropdownMenuEntries: _options.map<DropdownMenuEntry<String>>((
                String value,
              ) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  widget.onAddWord(
                    _newWordController.text,
                    _meaningController.text,
                    _selectedPartOfSpeech,
                  );
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(),
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

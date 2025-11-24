import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  final _newWordController = TextEditingController();
  final _meaningController = TextEditingController();

  final Function onAddWord;

  AddWordDialog({super.key, required this.onAddWord});

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
                  "Add New Word",
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
                label: Text("Từ mới"),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _meaningController,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Nghĩa tiếng việt"),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _meaningController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Nghĩa tiếng việt"),
              ),
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => onAddWord(),
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

import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  final _newWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 15),
              child: Row(
                children: [
                  Text(
                    "Add New Word",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),

                  IconButton(onPressed: () => {}, icon: Icon(Icons.close)),
                ],
              ),
            ),

            Flex(
              direction: Axis.vertical,
              children: [
                TextField(
                  controller: _newWordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Tu moi"),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 12)),

                TextField(
                  controller: _newWordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Vietnamese"),
                  ),
                ),
              ],
            ),

            Row(
              spacing: 23,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FilledButton(onPressed: () => {}, child: Text('Add'), style: ButtonStyle(
                  
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

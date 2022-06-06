import 'package:flutter/material.dart';

class NoteListItemWidget extends StatelessWidget {
  const NoteListItemWidget({Key? key, this.isDone = false}) : super(key: key);

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDone ? Colors.green[100] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Catatan"),
                  SizedBox(height: 5),
                  Text("deskripsi"),
                ],
              ),
            ),
            const SizedBox(width: 5),
            if (!isDone) ...{
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {},
                child: const Icon(Icons.check),
              ),
            }
          ],
        ),
      ),
    );
  }
}

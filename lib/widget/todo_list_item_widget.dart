import 'package:flutter/material.dart';
import 'package:fugi_provider_state_management/provider/todo_list_unsucces_provider.dart';
import 'package:provider/provider.dart';

import '../model/todo_item_model.dart';

class NoteListItemWidget extends StatelessWidget {
  const NoteListItemWidget({
    Key? key,
    required this.itemModel,
    this.isDone = false,
  }) : super(key: key);

  final TodoItemModel itemModel;
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
                children: [
                  Text(itemModel.title),
                  const SizedBox(height: 5),
                  Text(itemModel.description),
                ],
              ),
            ),
            const SizedBox(width: 5),
            if (!isDone) ...{
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  context.read<TodoListUnSuccessProvider>().onDone(
                        context: context,
                        item: itemModel,
                      );
                },
                child: const Icon(Icons.check),
              ),
            }
          ],
        ),
      ),
    );
  }
}

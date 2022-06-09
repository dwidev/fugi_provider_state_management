import 'package:flutter/material.dart';
import 'package:fugi_provider_state_management/model/todo_item.dart';
import 'package:fugi_provider_state_management/provider/todo_list_done_provider.dart';
import 'package:fugi_provider_state_management/provider/todo_list_provider.dart';
import 'package:provider/provider.dart';

class NoteListItemWidget extends StatelessWidget {
  const NoteListItemWidget({
    Key? key,
    required this.index,
    required this.todoItem,
    this.isDone = false,
  }) : super(key: key);

  final int index;
  final TodoItem todoItem;
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
                  Text(todoItem.title),
                  const SizedBox(height: 5),
                  Text(todoItem.description),
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
                  context.read<TodoListPovider>().onChecklist(
                        index: index,
                        item: todoItem,
                      );
                  context.read<TodoListDoneProvider>().onAddItem(todoItem);
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

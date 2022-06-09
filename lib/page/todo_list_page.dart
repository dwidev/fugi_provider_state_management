import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_done_provider.dart';
import '../provider/todo_list_provider.dart';
import '../widget/note_list_item_widget.dart';
import 'todo_done_page.dart';
import 'todo_form_page.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fugi Note App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Todo list",
                  style: textTheme.bodyText1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoDonePage(),
                      ),
                    );
                  },
                  child: Text(
                      "Sudah diselesaikan ${context.watch<TodoListDoneProvider>().count}"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<TodoListPovider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: provider.listTodo.length,
                    itemBuilder: (context, index) {
                      final todoItem = provider.listTodo[index];
                      return NoteListItemWidget(
                        index: index,
                        todoItem: todoItem,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TodoFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

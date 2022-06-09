import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_done_provider.dart';
import '../widget/note_list_item_widget.dart';

class TodoDonePage extends StatelessWidget {
  const TodoDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fugi Todo App"),
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
                  "Todo yang sudah anda selesaikan",
                  style: textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<TodoListDoneProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: provider.listDone.length,
                    itemBuilder: (context, index) {
                      final todoItem = provider.listDone[index];

                      return NoteListItemWidget(
                        todoItem: todoItem,
                        index: index,
                        isDone: true,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

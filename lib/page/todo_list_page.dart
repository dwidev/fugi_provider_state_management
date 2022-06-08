import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_succes_provider.dart';
import '../provider/todo_list_unsucces_provider.dart';
import '../widget/todo_list_item_widget.dart';
import 'todo_done_page.dart';
import 'todo_form_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
                  child: Consumer<TodoListSuccessProvider>(
                      builder: (context, prov, child) {
                    return Text("Sudah diselesaikan (${prov.state.length})");
                  }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<TodoListUnSuccessProvider>(
                builder: (context, prov, child) {
                  if (prov.state.isEmpty) {
                    return const Center(
                      child: Text("Belum ada data nih"),
                    );
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: prov.state.length,
                    itemBuilder: (context, index) {
                      final item = prov.state[index];
                      return NoteListItemWidget(
                        itemModel: item,
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

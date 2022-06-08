import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_succes_provider.dart';
import '../widget/todo_list_item_widget.dart';

class TodoDonePage extends StatefulWidget {
  const TodoDonePage({Key? key}) : super(key: key);

  @override
  State<TodoDonePage> createState() => _TodoDonePageState();
}

class _TodoDonePageState extends State<TodoDonePage> {
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
              child: Consumer<TodoListSuccessProvider>(
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

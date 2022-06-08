import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_unsucces_provider.dart';

class TodoFormPage extends StatefulWidget {
  const TodoFormPage({Key? key}) : super(key: key);

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<TodoListUnSuccessProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan todo list"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: provider.titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: provider.descController,
              decoration: const InputDecoration(hintText: "description"),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                provider.onSaveItem(context: context);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}

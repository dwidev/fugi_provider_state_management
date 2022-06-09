import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_todo_provider.dart';
import '../provider/todo_list_provider.dart';

class TodoFormPage extends StatelessWidget {
  const TodoFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<FormTodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan todo list"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: provider.titleController,
                decoration: const InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gaboleh kosong ya';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: provider.descController,
                decoration: const InputDecoration(hintText: "description"),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gaboleh kosong ya';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final item = provider.getItem();

                  if (item != null) {
                    context.read<TodoListPovider>().addItem(item);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

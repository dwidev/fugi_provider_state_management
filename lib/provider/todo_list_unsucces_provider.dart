import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo_item_model.dart';
import 'todo_list_provider.dart';
import 'todo_list_succes_provider.dart';

class TodoListUnSuccessProvider extends TodoListProvider {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  void onDone({required BuildContext context, required TodoItemModel item}) {
    final succesProv = context.read<TodoListSuccessProvider>();
    state.removeAt(state.indexOf(item));
    succesProv.addItem(item);
    state = state;
  }

  void onSaveItem({required BuildContext context}) {
    final item = TodoItemModel(
      title: titleController.text,
      description: descController.text,
    );

    titleController.clear();
    descController.clear();
    addItem(item);
    Navigator.pop(context);
  }
}

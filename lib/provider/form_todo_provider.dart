import 'package:flutter/material.dart';

import '../model/todo_item.dart';

class FormTodoProvider {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  TodoItem? getItem() {
    if (formKey.currentState?.validate() == false) {
      return null;
    }

    final item = TodoItem(
      title: titleController.text,
      description: descController.text,
    );

    titleController.clear();
    descController.clear();

    return item;
  }
}

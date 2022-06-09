import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/todo_item.dart';

class TodoListPovider extends ChangeNotifier {
  TodoListPovider();

  final listTodo = <TodoItem>[];

  void addItem(TodoItem item) {
    listTodo.add(item);
    notifyListeners();
  }

  void onChecklist({
    required int index,
    required TodoItem item,
  }) {
    listTodo.removeAt(index);
    notifyListeners();
  }
}

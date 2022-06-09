import 'package:flutter/foundation.dart';

import '../model/todo_item.dart';

class TodoListDoneProvider extends ChangeNotifier {
  final listDone = <TodoItem>[];

  int get count => listDone.length;

  void onAddItem(TodoItem item) {
    listDone.add(item);
    notifyListeners();
  }
}

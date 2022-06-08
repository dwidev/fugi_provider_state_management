import '../model/todo_item_model.dart';
import 'base_provider.dart';

abstract class TodoListProvider extends BaseProvider<List<TodoItemModel>> {
  TodoListProvider() : super([]);

  void addItem(TodoItemModel item) {
    state.add(item);
    state = state;
  }
}

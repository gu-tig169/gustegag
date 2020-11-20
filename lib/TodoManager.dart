import 'package:app_todo/Todos.dart';

class TodoManager {
  List<Tasks> _list;

  ToDoManager() {
    _list = new List();
  }

  void addNewTodoItem(Tasks task) {
    _list.add(task);
  }

  void removeTodo(Tasks task) {
    _list.remove(task);
  }

  List<Tasks> getAllItems() {
    return _list;
  }

  List<Tasks> getDoneItems() {
    return _list.where((x) => x.isChecked).toList();
  }

  List<Tasks> getUnDoneItems() {
    return _list.where((x) => !x.isChecked).toList();
  }

  ///Method to create a list of all items, sorted by 'Undone' first then 'done'.
  List<Tasks> getAllAutoSorted() {
    List<Tasks> mixed = getUnDoneItems();
    mixed.addAll(getDoneItems());
    return mixed;
  }
}

import 'package:flutter/material.dart';
import 'Todos.dart';
import 'FilterList.dart';

class ListProvider extends ChangeNotifier {
  List<Tasks> _list = [];
  List<Tasks> get list => _list;

  void addTodo(Tasks todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTask(Tasks task) {
    _list.remove(task);
    notifyListeners();
  }

  void toggleDone(Tasks task, bool newValue) {
    task.status = newValue;
    notifyListeners();
  }
}

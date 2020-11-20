import 'package:flutter/material.dart';
import 'Todos.dart';

class ListProvider extends ChangeNotifier {
  List<Tasks> _tasks = new List<Tasks>();

  List<Tasks> get getTasks {
    return _tasks;
  }

  void addTasks(String title) {
    Tasks task = new Tasks(title);

    _tasks.add(task);

    notifyListeners();
  }

  void removeTasks(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

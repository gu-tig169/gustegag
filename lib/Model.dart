import 'package:flutter/material.dart';
import './Constants.dart';
import 'Api.dart';

class TodoTask {
  String message;
  String taskId;
  bool status = false;

  TodoTask({this.message, this.status, this.taskId});

  static Map<String, dynamic> toJson(TodoTask task) {
    return {
      'message': task.message,
      'status': task.status,
    };
  }

  static TodoTask fromJson(Map<String, dynamic> json) {
    return TodoTask(
      message: json['title'],
      status: json['done'],
      taskId: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoTask> _list = [];
  List<TodoTask> get list => _list;

  Future getList() async {
    List<TodoTask> list = await Api.getTasks();
    _list = list;
    notifyListeners();
  }

  void addTodo(TodoTask task) async {
    if (task.message == null) {
      await getList();
    } else {
      await Api.addTask(task);
      await getList();
    }
  }

  void removeTask(TodoTask task) async {
    await Api.deleteTask(task.taskId);
    await getList();
  }

  void toggleDone(TodoTask task, bool newValue) async {
    task.status = newValue;
    await Api.updateTodos(task);
    await getList();
  }

  void filterChange(String choice) async {
    Filter.show = choice;
    await Api.getTasks();
    await getList();
    filteredList(choice);

    notifyListeners();
  }

  void filteredList(String choice) {
    if (choice == 'all') {
      _list = list.toList();
    } else if (choice == 'undone') {
      _list = list.where((task) => task.status == false).toList();
    } else if (choice == 'done') {
      _list = list.where((task) => task.status == true).toList();
    }
  }
}

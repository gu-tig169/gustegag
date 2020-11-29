import 'dart:convert';
import 'Model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '70c14383-77ef-408e-868c-a14b73ca6f61';

class Api {
  static Future deleteTask(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
  }

  static Future addTask(TodoTask task) async {
    print(task);
    Map<String, dynamic> json = TodoTask.toJson(task);

    print(json);
    await http.post('$API_URL/todos?key=$API_KEY',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': task.message,
          'done': task.status,
        }));
    print('done');
  }

  static Future updateTodos(TodoTask task) async {
    print(task);
    Map<String, dynamic> json = TodoTask.toJson(task);
    print(json);
    var taskid = task.taskId;
    await http.put('$API_URL/todos/$taskid?key=$API_KEY',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': task.message,
          'done': task.status,
        }));
    print('done');
  }

  static Future<List<TodoTask>> getTasks() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);

    return json.map<TodoTask>((todo) {
      return TodoTask.fromJson(todo);
    }).toList();
  }
}

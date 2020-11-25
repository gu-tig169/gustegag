import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  final List<TodoTask> listFiltered;

  TodoList(this.listFiltered);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            listFiltered.map((task) => todoWidget(context, task)).toList());
  }

  Widget todoWidget(context, task) {
    return Card(
        margin: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: CheckboxListTile(
            activeColor: Color.fromARGB(225, 211, 196, 190),
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(task.message,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    decoration: task.status == false
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                    decorationThickness: 2.18)),
            value: task.status,
            onChanged: (bool newValue) {
              var state = Provider.of<MyState>(context, listen: false);
              state.toggleDone(task, newValue);
            },
            secondary: IconButton(
              icon: Icon(Icons.close, color: Colors.red[100]),
              onPressed: () {
                var state = Provider.of<MyState>(context, listen: false);
                state.removeTask(task);
              },
            ),
          ),
        ));
  }
}

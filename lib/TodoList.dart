import 'package:flutter/material.dart';
import 'Todos.dart';
import 'ListProvider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  final List<Tasks> list;

  TodoList(this.list);
  bool isChecked = true;

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => todoWidget(context, task)).toList());
  }

  Widget todoWidget(context, task) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
        child: CheckboxListTile(
          activeColor: Color.fromARGB(225, 211, 196, 190),
          checkColor: Colors.white,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(task.message,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                decoration: task.status == false
                    ? TextDecoration.none
                    : TextDecoration.lineThrough,
              )),
          value: task.done,
          onChanged: (bool newValue) {
            var state = Provider.of<ListProvider>(context, listen: false);
            state.toggleDone(task, newValue);
          },
          secondary: IconButton(
              hoverColor: Colors.red,
              icon: Icon(Icons.clear_rounded, color: Colors.red[100]),
              onPressed: () {
                print("HELLO DELETED");
                var state = Provider.of<ListProvider>(context, listen: false);
                state.removeTask(task);
              }),
        ),
      ),
    );
  }
}

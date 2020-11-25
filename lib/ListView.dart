import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './EditListView.dart';
import './Model.dart';
import './Constants.dart';
import 'TodoList.dart';

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 211, 196, 190),
      appBar: AppBar(
        title: Text('TO DO',
            style: TextStyle(
                color: Color.fromARGB(255, 244, 240, 240),
                fontSize: 45,
                fontWeight: FontWeight.w900)),
        titleSpacing: 0.0,
        toolbarHeight: 50,
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
              onSelected: (choice) {
                var state = Provider.of<MyState>(context, listen: false);
                state.filterChange(choice);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Color.fromARGB(225, 211, 196, 190),
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: (choice),
                    child:
                        Text((choice), style: TextStyle(color: Colors.white)),
                  );
                }).toList();
              })
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.listFiltered),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color.fromARGB(225, 211, 196, 190),
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditListview(TodoTask(message: null, status: false))));
          if (newTodo != null) {
            Provider.of<MyState>(context, listen: false).addTodo(newTodo);
          }
        },
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.all) {
      Filter.show = "all";
    } else if (choice == Constants.done) {
      Filter.show = "done";
    } else if (choice == Constants.undone) {
      Filter.show = "notDone";
    }
  }
}

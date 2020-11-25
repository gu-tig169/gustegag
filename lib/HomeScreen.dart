import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddScreen.dart';
import 'ListProvider.dart';
import './Todos.dart';
import 'FilterList.dart';
import 'package:provider/provider.dart';
import 'TodoList.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.homeScreen});

  final String homeScreen;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            PopupMenuButton(
                onSelected: choiceAction,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Color.fromARGB(225, 211, 196, 190),
                itemBuilder: (BuildContext context) {
                  return FilterList.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child:
                          Text(choice, style: TextStyle(color: Colors.white)),
                    );
                  }).toList();
                }),
          ]),
      body: Consumer<ListProvider>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddScreen(Tasks(message: null, status: false))));
          if (newTodo != null) {
            Provider.of<ListProvider>(context, listen: false).addTodo(newTodo);
          }
        },
        child: Icon(Icons.add_rounded),
        backgroundColor: Color.fromARGB(225, 211, 196, 190),
      ),
    );
  }
}

void choiceAction(String choice) {
  if (choice == FilterList.All) {
  } else if (choice == FilterList.Done) {
    print('Done');
  } else if (choice == FilterList.Undone) {
    print('Undone');
  }
}

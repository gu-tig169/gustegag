import 'package:app_todo/Todos.dart';
import 'package:flutter/material.dart';
import 'ListProvider.dart';

class AddScreen extends StatefulWidget {
  final Tasks task;

  AddScreen(this.task);

  @override
  State<StatefulWidget> createState() {
    return _AddScreenState(task);
  }
}

class _AddScreenState extends State<AddScreen> {
  String message;
  bool status;

  TextEditingController textEditingController;

  _AddScreenState(Tasks task) {
    this.message = task.message;
    this.status = task.status;

    textEditingController = TextEditingController(text: task.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(225, 211, 196, 190),
        appBar: _secondAppBar(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(height: 80),
              Text('What do you want to add?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300)),
              Container(height: 30),
              Container(
                color: Color.fromARGB(255, 244, 240, 240),
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                child: _textField(),
              ),
              Container(
                child: _iconButton(),
              )
            ])));
  }

  Widget _secondAppBar() {
    return AppBar(
      toolbarHeight: 100,
      shadowColor: Colors.transparent,
      title: Text('ADD NEW TASKS',
          style: TextStyle(
              color: Color.fromARGB(255, 244, 240, 240),
              fontSize: 30,
              fontWeight: FontWeight.w900)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _textField() {
    return Container(
        child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'e.g. work out',
                labelStyle: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w300))));
  }

  Widget _iconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlatButton.icon(
          icon: Icon(Icons.add_rounded, color: Colors.white),
          label: Text('ADD', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context, Tasks(message: message, status: status));
          },
        )
      ],
    );
  }
}

void _showSnackBar(context) {
  SnackBar mySnackBar =
      SnackBar(content: Text("Item can't be empty, type something!"));
  Scaffold.of(context).showSnackBar(mySnackBar);
}

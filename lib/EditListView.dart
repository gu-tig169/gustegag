import 'package:flutter/material.dart';
import './Model.dart';

class EditListview extends StatefulWidget {
  final TodoTask task;

  EditListview(this.task);

  @override
  State<StatefulWidget> createState() {
    return EditListviewState(task);
  }
}

class EditListviewState extends State<EditListview> {
  String message;
  bool status;

  TextEditingController textEditingController;

  EditListviewState(TodoTask task) {
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
      appBar: _appBar(),
      backgroundColor: Color.fromARGB(225, 211, 196, 190),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 80),
            Text('What do you want to add?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300)),
            Container(height: 10),
            Container(
              color: Color.fromARGB(255, 244, 240, 240),
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: _textInputField(),
            ),
            Container(height: 20),
            _iconButton(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
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

  Widget _iconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlatButton.icon(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          color: Colors.white30,
          icon: Icon(Icons.add_rounded, color: Colors.white, size: 25.0),
          label: Text('ADD',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          onPressed: () {
            Navigator.pop(context, TodoTask(message: message, status: status));
          },
        )
      ],
    );
  }

  // Text inmatningsfälet för att lägga till task med controller
  Widget _textInputField() {
    return Container(
        child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'e.g. work out',
                labelStyle: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w300))));
  }
}

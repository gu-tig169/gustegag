import 'package:flutter/material.dart';
import 'ListProvider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _Title = TextEditingController();

  @override
  void dispose() {
    _Title.dispose();
    super.dispose();
  }

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
            controller: _Title,
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
                setState(
                  () {
                    _Title.text.trim().isEmpty
                        ? _showSnackBar(context)
                        : Provider.of<ListProvider>(context, listen: false)
                            .addTasks(_Title.text);
                    Navigator.of(context).pop();
                  },
                );
              })
        ]);
  }
}

void _showSnackBar(context) {
  SnackBar mySnackBar =
      SnackBar(content: Text("Item can't be empty, type something!"));
  Scaffold.of(context).showSnackBar(mySnackBar);
}

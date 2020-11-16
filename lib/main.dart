import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  final List<String> task = [
    'Clean home',
    'Take a walk',
    'Excercise',
    'Do homework',
    'Have a meeting',
    'AW with friends',
    'Read book',
  ];
  final bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 214, 176, 159),
      appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text('TO DO',
              style: TextStyle(
                  color: Color.fromARGB(255, 244, 240, 240),
                  fontSize: 45,
                  fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            _popupWindow(),
          ]),
      floatingActionButton: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddView()));
            },
            child: Icon(Icons.add_rounded),
            backgroundColor: Color.fromARGB(225, 214, 176, 159),
          )),
      body: _listView(),
    );
  }

  Widget _popupWindow() {
    return PopupMenuButton<int>(
      color: Color.fromARGB(225, 214, 176, 159),
      itemBuilder: (context) => <PopupMenuEntry<int>>[
        PopupMenuItem(
          value: 1,
          child: Text(
            'All',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Done',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            'Undone',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
      icon: Icon(Icons.more_vert_rounded, color: Colors.white),
    );
  }

  Widget _listView() {
    return Container(
        height: 680,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 240, 240),
          border: Border.all(color: Color.fromARGB(10, 225, 220, 220)),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0)),
        ),
        child: Container(
            padding: EdgeInsets.only(left: 35, top: 70, right: 35),
            child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    checkColor: Colors.white,
                    value: _checked,
                    onChanged: (bool value) {},
                    title: Text(
                      '${task[index]}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: Icon(Icons.clear_sharp,
                        color: Color.fromARGB(225, 220, 209, 209)),
                    activeColor: Color.fromARGB(225, 220, 209, 209),
                  );
                })));
  }
}

class AddView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 214, 176, 159),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text('ADD NEW TASKS',
            style: TextStyle(
                color: Color.fromARGB(255, 244, 240, 240),
                fontSize: 30,
                fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 10),
            Text('What do you want to add?',
                style: TextStyle(color: Colors.white)),
            Container(height: 10),
            Container(
              color: Color.fromARGB(255, 244, 240, 240),
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hoverColor: Color.fromRGBO(226, 226, 226, 100),
                  border: OutlineInputBorder(),
                  labelText: 'e.g. Work Out',
                  labelStyle: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(height: 30),
            IconButton(
              icon: Icon(Icons.add_rounded),
              color: Colors.white,
              onPressed: () {
                print('Your tasks have been added');
              },
            ),
            Container(height: 90),
          ],
        ),
      ),
    );
  }
}

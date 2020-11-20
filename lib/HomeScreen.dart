import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListProvider.dart';
import 'AddScreen.dart';
import './Todos.dart';
import 'TodoManager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoManager todoManager = TodoManager();
  List<Tasks> itemList;

  @override
  void initState() {
    itemList = todoManager.getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 211, 196, 190),
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ListProvider>(
          builder: (context, ListProvider data, child) {
            return data.getTasks.length != 0
                ? ListView.builder(
                    itemCount: data.getTasks.length,
                    itemBuilder: (context, index) {
                      return TodoList(data.getTasks[index], index);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      AddScreen();
                    },
                    child: Center(
                        child: Text(
                      "ADD SOME TASKS...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add_rounded),
        backgroundColor: Color.fromARGB(225, 211, 196, 190),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
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
          _popupButton(),
        ]);
  }

  Widget _popupButton() {
    return PopupMenuButton<int>(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Color.fromARGB(225, 211, 196, 190),
        onSelected: (int action) {
          setState(() {
            switch (action) {
              case 1:
                itemList = todoManager.getAllItems();
                break;
              case 2:
                itemList = todoManager.getDoneItems();
                break;
              case 3:
                itemList = todoManager.getUnDoneItems();
                break;
            }
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "All",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "Undone",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ));
  }
}

// ignore: must_be_immutable
class TodoList extends StatelessWidget {
  final Tasks tasks;
  int index;

  TodoList(this.tasks, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
        child: ListTile(
          leading: Icon(Icons.check_box_outline_blank_sharp),
          title: Text(tasks.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
          trailing: IconButton(
              hoverColor: Colors.red,
              icon: Icon(Icons.clear_rounded, color: Colors.red[100]),
              onPressed: () {
                print("HELLO DELETED");
                Provider.of<ListProvider>(context, listen: false)
                    .removeTasks(index);
              }),
        ),
      ),
    );
  }
}

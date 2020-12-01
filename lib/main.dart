import 'package:flutter/material.dart';
import 'ListView.dart';
import 'Model.dart';
import 'package:provider/provider.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Listview(),
    );
  }
}

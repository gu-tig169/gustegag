import 'package:flutter/material.dart';
import './ListProvider.dart';
import './HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  var state = ListProvider();
  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Application',
      home: HomeScreen(),
    );
  }
}

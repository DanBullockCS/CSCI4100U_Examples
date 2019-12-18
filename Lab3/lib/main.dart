import 'package:flutter/material.dart';
import 'lab3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 03 and 04',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: lab3(title: 'Lab 03 and 04'),
    );
  }
}

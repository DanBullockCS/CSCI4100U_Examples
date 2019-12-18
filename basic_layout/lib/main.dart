import 'package:flutter/material.dart';
import 'basic_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Layout Icon Title',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BasicLayout(title: 'Basic Layout in Appbar title'),
    );
  }
}

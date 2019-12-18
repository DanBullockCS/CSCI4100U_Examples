import 'package:flutter/material.dart';
import 'birthday_list.dart';
import 'addbirthday.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Reminder',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BirthdayPage(title: 'Birthday Reminder'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/addBirthday': (BuildContext context) {
          return AddBirthdayPage(title: 'Adding a Birthday Page');
        },
      },
    );
  }
}

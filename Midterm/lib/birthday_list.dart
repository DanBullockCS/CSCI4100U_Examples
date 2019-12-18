import 'package:flutter/material.dart';

import 'models/BirthdayModel.dart';
import 'models/Birthday.dart';
import 'addbirthday.dart';

class BirthdayPage extends StatefulWidget {
  String title;

  BirthdayPage({this.title, Key key}) : super(key: key);

  @override
  _BirthdayPageState createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  var _BirthdayItem;
  var _lastInsertedId = 0;
  final _model = BirthdayModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Delete every Birthday
                //_deleteAllBirthdays();
              }),
        ],
      ),
      body: _createBirthdayList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBirthday(context);
        },
        tooltip: 'Add Birthday',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddBirthday(BuildContext context) async {
    var addbirthday = await Navigator.pushNamed(context, '/addBirthday');
  }

  Future<void> _addBirthday() async {
    Birthday newBirthday = Birthday(name: _BirthdayItem);
    _lastInsertedId = await _model.insertBirthday(newBirthday);
  }

  Future<void> _deleteBirthday() async {
    _model.deleteBirthday(_lastInsertedId);
    print("id: " + _lastInsertedId.toString() + " deleted");
  }

  Future<void> _deleteAllBirthdays() async {
    _model.deleteAllBirthdays();
    print("All birthdays deleted");
  }

  Future<void> _listBirthdays() async {
    List<Birthday> birthdays = await _model.getAllBirthdays();
    print('Birthdays:');
    for (Birthday birthday in birthdays) {
      print(birthday);
    }
    // Add all the birthdays into the Listview:
  }

  Widget _createBirthdayList() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("birthday name"),
            subtitle: Text('test'),
          );
        });
  }
}

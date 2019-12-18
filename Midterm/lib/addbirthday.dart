import 'package:flutter/material.dart';

class AddBirthday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adding New Birthday',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Adding New Birthday'),
        ),
        body: AddBirthdayPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(AddBirthday());
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}

class AddBirthdayPage extends StatefulWidget {
  AddBirthdayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddBirthdayPageState createState() => _AddBirthdayPageState();
}

class _AddBirthdayPageState extends State<AddBirthdayPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _type;
  String _date;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Type',
            ),
            value: _type,
            items: <String>['Friend, Self, Family, Co-worker']
                .map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                _type = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}

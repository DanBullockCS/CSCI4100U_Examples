import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab7/model/grade.dart';
import 'package:lab7/model/grade_model.dart';

import 'AddPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListGrades(),
    );
  }
}

class ListGrades extends StatefulWidget {
  ListGrades({Key key}) : super(key: key);

  @override
  _ListGradesState createState() => _ListGradesState();
}

class _ListGradesState extends State<ListGrades> {
  final _model = GradeModel(); // grade model for database
  Grade selectedgrade; // the current selected grade
  int lastID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Storage"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _navigatetoInsertPage(selectedgrade.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _deleteGrade(selectedgrade);
              });
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('grades').snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: snapshot.data.documents
                        .map<Widget>((data) => _buildGrade(context, data))
                        .toList(),
                  )
                : LinearProgressIndicator(); // If snapshot does not have data
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          lastID += 1;
          navigatetoAddPage(context);
        },
        tooltip: 'Add Grade',
        child: Icon(Icons.add),
      ),
    );
  }

  // List Tiles
  Widget _buildGrade(BuildContext context, DocumentSnapshot gradeData) {
    final grade = Grade.fromMap(gradeData.data, reference: gradeData.reference);
    //print("$grade"); // Listing all grades
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                color: selectedgrade == grade ? Colors.blue : Colors.white),
            child: ListTile(
              title: Text(grade.sid),
              subtitle: Text(grade.grade),
              onTap: () {
                setState(() {
                  selectedgrade = grade;
                  print('Selected grade is $selectedgrade');
                });
              },
            )));
  }

  Future navigatetoAddPage(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GradeForm(false, lastID.toString())));
  }

  Future _navigatetoInsertPage(String id) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GradeForm(true, id)));
  }

  void _deleteGrade(Grade grade) {
    _model.deleteGrade(grade);
  }
}

import 'package:flutter/material.dart';
import 'package:sqlite/model/grade.dart';
import 'package:sqlite/model/grade_model.dart';

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
  int selectedindex; // the selected index of that grade
  Grade selectedgrade; // the current selected grade
  List<Grade> studentGrades; // List of all student grades in database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form and SQlite"),
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
                _deleteGradeById(selectedgrade.id);
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: _listAllGrades(studentGrades),
          initialData: List(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data != null ? snapshot.data.length : 0,
                    itemBuilder: (context, int index) {
                      final grade = snapshot.data[index];
                      return Container(
                          child: GestureDetector(
                              onTap: () {
                                selectedindex = index;
                                print('Selected index: $selectedindex');
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: selectedindex == index
                                          ? Colors.blue
                                          : Colors.white),
                                  child: ListTile(
                                    title: Text(grade.sid),
                                    subtitle: Text(grade.grade),
                                    onTap: () {
                                      setState(() {
                                        selectedindex = index;
                                        selectedgrade = grade;
                                        print(
                                            'Selected index is $selectedindex');
                                      });
                                    },
                                  ))));
                    })
                : Center();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatetoAddPage(context);
        },
        tooltip: 'Add Grade',
        child: Icon(Icons.add),
      ),
    );
  }

  Future navigatetoAddPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GradeForm(false, 0)));
  }

  Future _navigatetoInsertPage(int id) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GradeForm(true, id)));
  }

  Future<List<Grade>> _listAllGrades(List<Grade> studentGrades) async {
    List<Grade> myGrades = await _model.getAllGrades();
    print("[main.dart] List All Grades:");
    myGrades.forEach((grade) => print(grade));
    studentGrades = myGrades;
    return myGrades;
  }

  Future<void> _deleteGradeById(int id) async {
    print('[main.dart] _deleteGrade delete id $id');
    int result = await _model.deleteGrade(id);
    print('result of delete: $result');
  }
}

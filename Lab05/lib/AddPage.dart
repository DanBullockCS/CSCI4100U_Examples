import 'package:flutter/material.dart';
import 'package:sqlite/model/grade_model.dart';
import 'model/grade.dart';

void main() => runApp(AddPage());

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// Define a custom Form widget.s
class GradeForm extends StatefulWidget {
  bool insert = false;
  int id = 0;

  GradeForm(insert, id) {
    this.insert = insert;
    this.id = id;
  }

  @override
  _GradeFormState createState() => _GradeFormState(this.insert, this.id);
}

class _GradeFormState extends State<GradeForm> {
  final sidController = TextEditingController();
  final gradeController = TextEditingController();
  final _model = GradeModel();

  int id = 0;
  bool insert = false;

  _GradeFormState(insert, id) {
    this.insert = insert;
    this.id = id;
  }

  @override
  void dispose() {
    sidController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Grades'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 16),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'SID'),
              controller: sidController,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Grade'),
                controller: gradeController,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Grade grade;
          if (this.insert) {
            grade = new Grade(
                id: this.id,
                sid: sidController.text,
                grade: gradeController.text);
          } else {
            grade =
                new Grade(sid: sidController.text, grade: gradeController.text);
          }
          print('$grade');
          if (this.insert) {
            _editGrade(grade);
          }
          _addGrade(grade);
          Navigator.of(context).pop();
        },
        tooltip: 'save',
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _editGrade(Grade grade) async {
    int result = await _model.updateGrade(grade);
    print('[AddPage] _editGrade result: $result');
  }

  Future<void> _addGrade(Grade grade) async {
    int result = await _model.insertGrade(grade);
    print('[AddPage] _addGrade result: $result');
  }
}

import 'grade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GradeModel {
  void insertGrade(Grade grade) async {
    CollectionReference grades = Firestore.instance.collection('grades');
    await grades.add(grade.toMap());
  }

  void updateGrade(Grade grade, data) async {
    try {
      Firestore.instance
        .collection('grades')
        .document(grade.id)
        .updateData(data);
    } catch (e) {
      print(e.toString());
    }

  }

  void deleteGrade(Grade grade) {
    grade.reference.delete();
  }

}
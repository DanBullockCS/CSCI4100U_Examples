import 'package:cloud_firestore/cloud_firestore.dart';

class Grade {
  Grade({this.id, this.sid, this.grade, this.reference});

  String id;
  String grade;
  String sid;
  DocumentReference reference;

  Grade.fromMap(Map<String, dynamic> map, {this.reference}) {
    this.id = map['id'];
    this.sid = map['sid'];
    this.grade = map['grade'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'sid': this.sid,
      'grade': this.grade,
      'reference': this.reference,
    };
  }

  @override
  String toString() {
    return 'Grade{id: $id, sid: $sid, grade: $grade}';
  }
}

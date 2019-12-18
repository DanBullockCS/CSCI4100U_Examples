class Grade {
  Grade({this.id, this.sid, this.grade});

  int id;
  String grade;
  String sid;

  Grade.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.sid = map['sid'];
    this.grade = map['grade'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'sid': this.sid,
      'grade': this.grade,
    };
  }

  @override
  String toString() {
    return 'Grade{id: $id,sid: $sid grade: $grade}';
  }
}

class Birthday {
  Birthday({this.name, this.type, this.birthdate});

  int id;
  String name;
  String type; // Self, friend, family, co-worker
  String birthdate; // e.g. December 17th

  Birthday.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.type = map['type'];
    this.birthdate = map['birthdate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'type': this.type,
      'birthdate': this.birthdate,
    };
  }

  @override
  String toString() {
    return 'Birthday{id: $id, name: $name, type: $type, birthdate: $birthdate}';
  }
}

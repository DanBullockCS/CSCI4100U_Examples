import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future<Database> init() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'test_grades.db'),
      onCreate: (db, version) {
        if (version > 1) {
        }
        db.execute('CREATE TABLE grades(id INTEGER PRIMARY KEY, sid INTEGER, grade TEXT)');
      },
      version: 1,
    );
  }
}
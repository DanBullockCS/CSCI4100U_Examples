import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future<Database> init() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'birthday_list.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE birthday_items(id INTEGER PRIMARY KEY, name TEXT)');
      },
      version: 1,
    );
  }
}

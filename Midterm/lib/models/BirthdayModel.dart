import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'db_utils.dart';
import 'Birthday.dart';

class BirthdayModel {
  Future<int> insertBirthday(Birthday Birthday) async {
    final db = await DBUtils.init();
    return await db.insert(
      'Birthday_items',
      Birthday.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteBirthday(int id) async {
    final db = await DBUtils.init();
    return await db.delete(
      'Birthday_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Birthday>> getAllBirthdays() async {
    final db = await DBUtils.init();
    List<Map<String, dynamic>> maps = await db.query('Birthday_items');
    List<Birthday> Birthdays = [];
    for (int i = 0; i < maps.length; i++) {
      Birthdays.add(Birthday.fromMap(maps[i]));
    }
    return Birthdays;
  }

  Future<int> deleteAllBirthdays() async {
    //TODO delete all birthdays
    final db = await DBUtils.init();
    return await db.delete(
      'Birthday_items',
    );
  }
}

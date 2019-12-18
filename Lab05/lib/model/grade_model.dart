import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'db_utils.dart';
import 'grade.dart';

class GradeModel {
  Future<int> insertGrade(Grade grade) async {
    final db = await DBUtils.init();
    return await db.insert(
      'grades',
      grade.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateGrade(Grade grade) async {
    final db = await DBUtils.init();
    return await db.update(
      'grades',
      grade.toMap(), // data to replace with
      where: 'id = ?',
      whereArgs: [grade.id],
    );
  }

  Future<int> deleteGrade(int id) async {
    final db = await DBUtils.init();
    return await db.delete(
      'grades',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Grade>> getAllGrades() async {
    final db = await DBUtils.init();
    List<Map<String,dynamic>> maps = await db.query('grades');
    List<Grade> grades = [];
    for (int i = 0; i < maps.length; i++) {
      grades.add(Grade.fromMap(maps[i]));
    }
    return grades;
  }

  Future<Grade> getGradeWithId(int id) async {
    final db = await DBUtils.init();
    List<Map<String,dynamic>> maps = await db.query(
      'grades',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return Grade.fromMap(maps[0]);
    } else {
      return null;
    }
  }
}
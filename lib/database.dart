import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entities/entities.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  User,
  Role,
  RoleUser,
  Course,
  CourseUser,
])
@TypeConverters([RoleTypeConverter])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  RoleDao get roleDao;
  RoleUserDao get roleUserDao;
  CourseDao get courseDao;
  CourseUserDao get courseUserDao;
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  late AppDatabase? _database;
  Future<AppDatabase> get database async {
    if (_database != null) {
      return _database!;
    }

    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    return _database!;
  }
}

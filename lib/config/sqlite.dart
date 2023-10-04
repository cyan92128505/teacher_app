// import 'package:sqflite/sqflite.dart';

class SqliteConfig {
  static final SqliteConfig _instance = SqliteConfig._internal();

  factory SqliteConfig() {
    return _instance;
  }

  SqliteConfig._internal();

  static Future<void> initial() async {
    // var databasesPath = await getDatabasesPath();
    // print(databasesPath);
  }
}

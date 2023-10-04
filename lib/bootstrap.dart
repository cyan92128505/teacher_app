import 'package:flutter/material.dart';
import 'package:teacher/app/normal_app.dart';
import 'package:teacher/config/sqlite.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  SqliteConfig.initial();

  runApp(const NormalApp());
}

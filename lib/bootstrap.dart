import 'package:flutter/material.dart';
import 'package:teacher/app/normal_app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NormalApp());
}

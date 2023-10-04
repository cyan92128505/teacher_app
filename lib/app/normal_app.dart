import 'package:flutter/material.dart';
import 'package:teacher/views/home.dart';

class NormalApp extends StatelessWidget {
  const NormalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(color: Colors.black87),
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TeacherListPage(),
    );
  }
}

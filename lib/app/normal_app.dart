import 'package:flutter/material.dart';
import 'package:teacher/configs/theme.dart';
import 'package:teacher/routes/routes.dart';

class NormalApp extends StatelessWidget {
  const NormalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: defaultThemeData,
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teacher/views/splash.dart';

final _parentKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _parentKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: '/',
      name: '/',
      pageBuilder: (context, state) => const MaterialPage(child: SplashView()),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teacher/views/splash.dart';

final _parentKey = GlobalKey<NavigatorState>();

const rootPath = '/';
const loginPath = '/login';
const homePath = '/home';
const teacherPath = '/teacher';
const teacherDetailPath = '/teacher/:id';

final router = GoRouter(
  navigatorKey: _parentKey,
  initialLocation: rootPath,
  routes: [
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: rootPath,
      name: rootPath,
      pageBuilder: (context, state) => const MaterialPage(child: SplashView()),
    ),
  ],
);

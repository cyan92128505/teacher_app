import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teacher/app/normal_app.dart';
import 'package:teacher/utils/error.dart';

Future<void> bootstrap() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      usePathUrlStrategy();

      runApp(
        const ProviderScope(
          child: NormalApp(),
        ),
      );
    },
    printError,
  );
}

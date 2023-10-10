import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teacher/views/error_view.dart';

void printError(Object error, StackTrace stackTrace) {
  debugPrint(
    error.toString(),
  );
  debugPrint(
    stackTrace.toString(),
  );
}

void prepareErrorView() {
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
    );
  };

  ErrorWidget.builder = (
    FlutterErrorDetails details,
  ) =>
      ErrorView(
        details,
      );
}

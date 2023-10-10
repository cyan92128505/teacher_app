import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInitail(Function exec) {
  return use(_InitialHook(exec));
}

class _InitialHook extends Hook<void> {
  final Function exec;
  const _InitialHook(this.exec);

  @override
  HookState<void, Hook<void>> createState() => _Initialtate(exec);
}

class _Initialtate extends HookState<void, _InitialHook> {
  final Function exec;
  late bool initial = false;

  _Initialtate(this.exec);
  @override
  void build(BuildContext context) {
    if (initial) {
      return;
    }
    initial = true;
    exec();
  }

  @override
  String get debugLabel => 'useInitial';
}

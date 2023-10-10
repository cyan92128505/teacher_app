import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.details, {super.key});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          Expanded(
            child: SelectableText(
              details.toString(),
            ),
          ),
        ],
      ),
    );
  }
}

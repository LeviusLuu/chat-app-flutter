import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            context.go("/message/1");
          },
          child: const Text("demo")),
    );
  }
}

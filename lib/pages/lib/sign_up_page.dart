import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 5),
          onPressed: () => context.push("/login"),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SizedBox.expand(),
    );
  }
}

import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(4, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 4),
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}

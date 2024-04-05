import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldCostum extends StatefulWidget {
  TextFieldCostum({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
  });
  TextEditingController controller;
  String hintText;
  bool? obscureText;

  @override
  State<TextFieldCostum> createState() => _TextFieldCostumState();
}

class _TextFieldCostumState extends State<TextFieldCostum> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
      ),
    );
  }
}

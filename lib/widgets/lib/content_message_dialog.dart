import 'package:flutter/material.dart';

import '../widgets.dart';

class ContentMessageDialog extends StatefulWidget {
  const ContentMessageDialog({
    super.key,
    required this.controller,
    required this.widget,
  });

  final AnimationController controller;
  final MessageDialog widget;

  @override
  State<ContentMessageDialog> createState() => _ContentMessageDialogState();
}

class _ContentMessageDialogState extends State<ContentMessageDialog> {
  @override
  void initState() {
    super.initState();
    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ScaleTransition(
        scale: CurvedAnimation(
            parent: widget.controller, curve: Curves.elasticInOut),
        child: ContentMessage(
          isNext: widget.widget.isNext,
          isPre: widget.widget.isPre,
          widget: widget.widget.widget,
          isDialog: true,
        ),
      ),
    );
  }
}

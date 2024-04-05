import 'package:flutter/material.dart';

class ReactionPickerMessageDialog extends StatefulWidget {
  const ReactionPickerMessageDialog({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  State<ReactionPickerMessageDialog> createState() =>
      _ReactionPickerMessageDialogState();
}

class _ReactionPickerMessageDialogState
    extends State<ReactionPickerMessageDialog> {
  final String pathReactionImage = "assets/images/";
  final List<String> reactionList = [
    'heart.png',
    'laughing.png',
    'open_mouth.png',
    'disappointed_relieved.png',
    'angry.png',
    '+1.png',
  ];

  @override
  void initState() {
    super.initState();
    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {},
      child: ScaleTransition(
        scale: CurvedAnimation(
            parent: widget.controller, curve: Curves.elasticInOut),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            color: colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              ...reactionList.map((e) {
                return IconButton(
                  onPressed: () {},
                  icon: Image(
                    image: AssetImage("$pathReactionImage$e"),
                    height: 30,
                    width: 30,
                  ),
                );
              }),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

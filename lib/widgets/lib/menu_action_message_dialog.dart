import 'package:flutter/material.dart';

class MenuActionMessageDialog extends StatefulWidget {
  const MenuActionMessageDialog({
    super.key,
    required this.controller,
    required this.isSender,
  });

  final AnimationController controller;
  final bool isSender;

  @override
  State<MenuActionMessageDialog> createState() =>
      _MenuActionMessageDialogState();
}

class _MenuActionMessageDialogState extends State<MenuActionMessageDialog> {
  late List<String> tiltes = widget.isSender
      ? ['Reply', 'Copy', 'Forward']
      : ['Reply', 'Copy', 'Unsend'];
  late List<IconData> icons = widget.isSender
      ? [Icons.reply, Icons.copy, Icons.reply]
      : [Icons.reply, Icons.copy, Icons.delete];

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
          width: 250,
          decoration: BoxDecoration(
            color: colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tiltes.length,
            itemBuilder: (context, index) {
              Color color = !widget.isSender && index == 2
                  ? Colors.red
                  : colorScheme.onSecondary;
              return SizedBox(
                height: 30,
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tiltes[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: color,
                            ),
                          ),
                          widget.isSender && index == 2
                              ? Transform.flip(
                                  flipX: true,
                                  child: Icon(
                                    icons[index],
                                    color: color,
                                  ),
                                )
                              : Icon(
                                  icons[index],
                                  color: color,
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(thickness: 1, color: colorScheme.outline),
          ),
        ),
      ),
    );
  }
}

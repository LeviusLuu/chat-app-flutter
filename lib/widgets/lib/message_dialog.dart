import 'package:flutter/material.dart';

import '../widgets.dart';

class MessageDialog extends StatefulWidget {
  const MessageDialog({
    super.key,
    required this.messageKey,
    required this.isSender,
    required this.isPre,
    required this.isNext,
    required this.widget,
    required this.setIsShow,
  });

  final GlobalKey messageKey;
  final bool isSender;
  final bool isPre;
  final bool isNext;
  final LayoutMessage widget;
  final void Function(bool value) setIsShow;

  @override
  State<MessageDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    RenderBox box =
        widget.messageKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    Size size = box.size;
    Size maxSize = MediaQuery.of(context).size;

    double? left = widget.isSender ? position.dx : null;
    double? right =
        widget.isSender ? null : maxSize.width - position.dx - size.width;
    double? top = position.dy - 60;
    double? bottom;

    if (top < 10) top = 20;

    if (maxSize.height - top - size.height < 230) {
      top = null;
      bottom = 30;
    }

    return GestureDetector(
      onTap: () {
        controller.reverse().then((value) {
          widget.setIsShow(true);
          Navigator.of(context).pop();
        });
      },
      child: Container(
        color: colorScheme.background.withOpacity(0.7),
        child: Stack(
          children: [
            Positioned(
                top: top,
                left: left,
                right: right,
                bottom: bottom,
                child: Column(
                  crossAxisAlignment: widget.isSender
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    ReactionPickerMessageDialog(controller: controller),
                    const SizedBox(height: 10),
                    ContentMessageDialog(
                        controller: controller, widget: widget),
                    const SizedBox(height: 10),
                    MenuActionMessageDialog(
                        controller: controller, isSender: widget.isSender),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

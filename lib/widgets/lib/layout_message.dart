import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

// ignore: must_be_immutable
class LayoutMessage extends StatefulWidget {
  LayoutMessage({
    super.key,
    required this.replyMessage,
    required this.isSender,
    required this.colorScheme,
    required this.messageItem,
    required this.chatItem,
    this.preMessageItem,
    this.nextMessageItem,
  });

  final MessageModel? replyMessage;
  final bool isSender;
  final ColorScheme colorScheme;
  final MessageModel messageItem;
  final ChatModel chatItem;
  MessageModel? preMessageItem;
  MessageModel? nextMessageItem;

  @override
  State<LayoutMessage> createState() => _LayoutMessageState();
}

class _LayoutMessageState extends State<LayoutMessage> {
  final GlobalKey messageKey = GlobalKey();

  bool isShow = true;

  @override
  void initState() {
    super.initState();
  }

  void setIsShow(bool value) {
    setState(() {
      isShow = value;
    });
  }

  Future<void> dialogBuilder(bool isPre, bool isNext, bool isSender) {
    setIsShow(false);
    return showDialog<void>(
      barrierColor: Colors.transparent,
      useSafeArea: false,
      context: context,
      builder: (context) {
        return MessageDialog(
          isPre: isPre,
          isNext: isNext,
          isSender: isSender,
          messageKey: messageKey,
          widget: widget,
          setIsShow: setIsShow,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPre = widget.preMessageItem != null
        ? widget.preMessageItem!.senderId == widget.messageItem.senderId
        : false;
    bool isNext = widget.nextMessageItem != null
        ? widget.nextMessageItem!.senderId == widget.messageItem.senderId
        : false;
    return GestureDetector(
      onLongPress: () => dialogBuilder(isPre, isNext, widget.isSender),
      child: Opacity(
        opacity: isShow ? 1 : 0,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: isNext ? 3 : 15, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: widget.isSender
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.isSender && !isNext
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 14,
                        child: Text(
                          widget.chatItem.avatar,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  : Container(
                      width: 28 + 10,
                    ),
              ContentMessage(
                key: messageKey,
                isNext: isNext,
                isPre: isPre,
                widget: widget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

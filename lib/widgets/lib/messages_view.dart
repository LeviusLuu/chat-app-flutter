import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../widgets.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({
    super.key,
    required this.chatItem,
    required this.messages,
    required this.controller,
  });
  final ChatModel chatItem;
  final List<MessageModel> messages;
  final ScrollController controller;

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  late UserModel? user = Provider.of<UserSessionProvider>(context).user;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      controller: widget.controller,
      reverse: true,
      child: Column(
        children: [
          ...List.generate(widget.messages.length, (index) {
            MessageModel messageItem = widget.messages[index];

            int preIndex = index - 1;
            MessageModel? preMessageItem =
                preIndex < 0 ? null : widget.messages[preIndex];

            int nextIndex = index + 1;
            MessageModel? nextMessageItem =
                nextIndex > widget.messages.length - 1
                    ? null
                    : widget.messages[nextIndex];
            bool isSender = user!.id != messageItem.senderId;
            MessageModel? replyMessage = messageItem.replyId != null
                ? widget.messages
                    .where((element) => element.id == messageItem.replyId)
                    .first
                : null;

            return LayoutMessage(
              replyMessage: replyMessage,
              isSender: isSender,
              colorScheme: colorScheme,
              preMessageItem: preMessageItem,
              nextMessageItem: nextMessageItem,
              messageItem: messageItem,
              chatItem: widget.chatItem,
            );
          })
        ],
      ),
    );
  }
}

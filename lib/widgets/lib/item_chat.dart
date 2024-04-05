import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class ItemChat extends StatefulWidget {
  const ItemChat({
    super.key,
    required this.chatItem,
    required this.colorScheme,
  });

  final ChatModel chatItem;
  final ColorScheme colorScheme;

  @override
  State<ItemChat> createState() => _ItemChatState();
}

class _ItemChatState extends State<ItemChat> {
  final GlobalKey keyChat = GlobalKey();
  late ChatPageProvider chatPageProvider =
      Provider.of<ChatPageProvider>(context, listen: false);

  late String? selectedChatId = chatPageProvider.chatId;

  @override
  void initState() {
    super.initState();
    chatPageProvider.addListener(() {
      if (mounted) {
        setState(() {
          selectedChatId = chatPageProvider.chatId;
        });
      }
    });
  }

  @override
  void dispose() {
    chatPageProvider.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Slidable(
      key: keyChat,
      actionPane: const SlidableStrechActionPane(),
      actionExtentRatio: 0.2,
      showAllActionsThreshold: 0,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.grey.shade500,
          icon: Icons.more_horiz,
          foregroundColor: Colors.white,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Archive',
          color: Colors.purple,
          icon: Icons.archive,
          onTap: () {},
        ),
      ],
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        selected: selectedChatId == "/message/${widget.chatItem.id}",
        hoverColor: colorScheme.onBackground,
        selectedTileColor: colorScheme.onSecondaryContainer,
        onTap: () {
          chatPageProvider.setSelectedChatId(widget.chatItem.id);
          String url = "/message/${widget.chatItem.id}";
          context.go(url);
        },
        leading: CircleAvatar(
          radius: 30,
          child: Text(widget.chatItem.avatar),
        ),
        title: Text(
          widget.chatItem.fullname,
          style: TextStyle(fontSize: 16, color: widget.colorScheme.onSecondary),
        ),
        subtitle: Text(
          widget.chatItem.currentMessgase,
          style: TextStyle(color: widget.colorScheme.onSecondary),
        ),
      ),
    );
  }
}

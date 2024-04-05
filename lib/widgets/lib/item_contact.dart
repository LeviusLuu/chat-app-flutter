import 'package:flutter/material.dart';

import '../../models/models.dart';

class ItemContact extends StatefulWidget {
  const ItemContact({
    super.key,
    required this.contactItem,
    required this.colorScheme,
  });

  final ContactModel contactItem;
  final ColorScheme colorScheme;

  @override
  State<ItemContact> createState() => _ItemContactState();
}

class _ItemContactState extends State<ItemContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
          onTap: () {},
          leading: CircleAvatar(
            radius: 30,
            child: Text(widget.contactItem.avatar),
          ),
          title: Text(
            widget.contactItem.fullname,
            style:
                TextStyle(fontSize: 16, color: widget.colorScheme.onSecondary),
          ),
        ),
        const Divider(
          height: 1,
          indent: 16,
        ),
      ],
    );
  }
}

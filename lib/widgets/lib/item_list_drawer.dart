import 'package:flutter/material.dart';

class ItemListDrawer extends StatefulWidget {
  const ItemListDrawer({
    super.key,
    required this.index,
    required this.indexSelected,
    required this.icon,
    required this.tilte,
  });

  final int index;
  final int indexSelected;
  final Icon icon;
  final String tilte;

  @override
  State<ItemListDrawer> createState() => _ItemListDrawerState();
}

class _ItemListDrawerState extends State<ItemListDrawer> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: widget.index == widget.indexSelected
            ? colorScheme.onBackground
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: colorScheme.onPrimary,
          ),
          child: widget.icon,
        ),
        title: Text(
          widget.tilte,
          style: TextStyle(
            color: colorScheme.onSecondary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

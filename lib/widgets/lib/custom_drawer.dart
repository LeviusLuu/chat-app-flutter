import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../widgets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.titles,
    required this.selectedScreen,
    required this.iconItem,
    required this.onItemTapped,
  });

  final List<String> titles;
  final int selectedScreen;
  final List<Icon> iconItem;
  final void Function(int index) onItemTapped;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late UserModel? user;

  @override
  void initState() {
    super.initState();
    Provider.of<UserSessionProvider>(context, listen: false).addListener(() {
      setState(() {});
    });

    user = Provider.of<UserSessionProvider>(context, listen: false).user;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 10, right: 5),
            leading: CircleAvatar(
              child: Text(user!.avatar),
            ),
            title: Row(
              children: [
                Text(user!.fullname),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: colorScheme.primary,
                size: 28,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(widget.titles.length, (index) {
            return GestureDetector(
              onTap: () {
                widget.onItemTapped(index);
                Navigator.pop(context);
              },
              child: ItemListDrawer(
                index: index,
                icon: widget.iconItem[index],
                indexSelected: widget.selectedScreen,
                tilte: widget.titles[index],
              ),
            );
          }),
        ],
      ),
    );
  }
}

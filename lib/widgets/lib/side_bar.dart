import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../widgets.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
  late List<String> titles = sideBarProvider.titles;
  late List<Icon> iconItem = sideBarProvider.iconItem;

  late UserModel? user = Provider.of<UserSessionProvider>(context).user;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final int selectedScreen = sideBarProvider.selectedScreen;
    final int optionSideBar = sideBarProvider.optionSideBar;
    return AnimatedSize(
      alignment: Alignment.topLeft,
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: double.infinity,
        width: optionSideBar == 1 ? 220 : 80,
        margin: const EdgeInsets.only(right: 3),
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        decoration: BoxDecoration(
          color: colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: const Offset(-1, 3),
            ),
          ],
        ),
        child: AnimatedSize(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => context.go("/"),
                child: const FlutterLogo(
                  size: 80,
                ),
              ),
              const SizedBox(height: 50),
              ...List.generate(titles.length, (index) {
                Icon icon = iconItem[index];
                String title = titles[index];
                return SideBarMenuItem(
                    selectedScreen: selectedScreen,
                    colorScheme: colorScheme,
                    optionSideBar: optionSideBar,
                    icon: icon,
                    title: title,
                    index: index);
              }),
              Expanded(child: Container()),
              SideBarButtonContextMenu(
                  optionSideBar: optionSideBar,
                  colorScheme: colorScheme,
                  user: user),
            ],
          ),
        ),
      ),
    );
  }
}

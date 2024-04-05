import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class SideBarMenuItem extends StatelessWidget {
  const SideBarMenuItem({
    super.key,
    required this.selectedScreen,
    required this.colorScheme,
    required this.optionSideBar,
    required this.icon,
    required this.title,
    required this.index,
  });

  final int selectedScreen;
  final ColorScheme colorScheme;
  final int optionSideBar;
  final Icon icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topLeft,
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: () => Provider.of<SideBarProvider>(context, listen: false)
            .setSelectedScreen(index),
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: index == selectedScreen ? colorScheme.onBackground : null,
          ),
          child: Row(
            mainAxisSize:
                optionSideBar == 1 ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: colorScheme.onPrimary,
                ),
                child: icon,
              ),
              optionSideBar == 1
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

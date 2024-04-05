import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class ButtonResizeSideBar extends StatefulWidget {
  const ButtonResizeSideBar({
    super.key,
  });

  @override
  State<ButtonResizeSideBar> createState() => _ButtonResizeSideBarState();
}

class _ButtonResizeSideBarState extends State<ButtonResizeSideBar> {
  late SideBarProvider sideBarProvider =
      Provider.of<SideBarProvider>(context, listen: false);

  late int optionSideBar = sideBarProvider.optionSideBar;

  @override
  void initState() {
    sideBarProvider.addListener(() {
      if (mounted) {
        setState(() {
          optionSideBar = sideBarProvider.optionSideBar;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      top: 10,
      left: Provider.of<SideBarProvider>(context).optionSideBar == 0
          ? 80 - 20
          : 220 - 20,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomHalfCircleClipper(),
            child: ClipOval(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(5),
            onPressed: () {
              sideBarProvider.setOptionSideBar();
            },
            icon: CircleAvatar(
              radius: 15,
              child: Container(
                padding:
                    optionSideBar == 1 ? const EdgeInsets.only(left: 5) : null,
                child: Icon(
                  optionSideBar == 0
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width / 2 + 2, 0);
    path.lineTo(size.width / 2 + 2, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

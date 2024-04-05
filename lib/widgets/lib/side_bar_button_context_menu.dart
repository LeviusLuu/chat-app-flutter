import 'package:chat_app_v_0_2/models/models.dart';
import 'package:chat_app_v_0_2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarButtonContextMenu extends StatefulWidget {
  const SideBarButtonContextMenu({
    super.key,
    required this.optionSideBar,
    required this.colorScheme,
    required this.user,
  });

  final int optionSideBar;
  final ColorScheme colorScheme;
  final UserModel? user;

  @override
  State<SideBarButtonContextMenu> createState() =>
      _SideBarButtonContextMenuState();
}

class _SideBarButtonContextMenuState extends State<SideBarButtonContextMenu> {
  GlobalKey buttonKey = GlobalKey();
  late SideBarProvider sideBarProvider =
      Provider.of<SideBarProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();
    sideBarProvider.addListener(() {});
  }

  @override
  void dispose() {
    sideBarProvider.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RenderBox box =
            buttonKey.currentContext!.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        sideBarProvider.setBtn(position, box.size);

        if (sideBarProvider.positionMenuContext != Offset.zero) {
          sideBarProvider.setPosMenuContext(Offset.zero);
        } else {
          Size maxSize = MediaQuery.of(context).size;
          Offset appearOffset = sideBarProvider.optionSideBar == 0
              ? Offset(
                  position.dx + box.size.width,
                  maxSize.height - position.dy - box.size.height,
                )
              : Offset(position.dx, maxSize.height - position.dy);
          sideBarProvider.setPosMenuContext(appearOffset);
        }
      },
      child: Container(
        key: buttonKey,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: widget.optionSideBar == 1
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: widget.colorScheme.onPrimary),
                child:
                    CircleAvatar(radius: 15, child: Text(widget.user!.avatar))),
            if (widget.optionSideBar == 1) ...[
              const SizedBox(width: 8),
              Text(widget.user!.fullname,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(child: Container()),
              Icon(sideBarProvider.positionMenuContext != Offset.zero
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up)
            ]
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../pages/pages.dart';
import '../../widgets/widgets.dart';

class ContentResponesive extends StatelessWidget {
  const ContentResponesive({Key? key, required this.contentWiget})
      : super(key: key);

  final Widget contentWiget;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isShow = MediaQuery.of(context).size.width >= 1100;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Row(
                children: [
                  if (isShow) ...[
                    const SideBar(),
                    const Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: HomePage(),
                    ),
                  ],
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Container(
                      padding: isShow ? const EdgeInsets.only(left: 3) : null,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 2,
                            offset: const Offset(4, 3),
                          ),
                        ],
                      ),
                      child: contentWiget,
                    ),
                  )
                ],
              ),
              if (isShow) ...[
                const ButtonResizeSideBar(),
                const ProfileMenuContext(),
              ],
            ],
          );
        },
      ),
    );
  }
}

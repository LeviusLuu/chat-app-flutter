import 'package:flutter/material.dart';

import '../../pages/pages.dart';
import '../../screens/screens.dart';
import '../../widgets/widgets.dart';

class HomeResponesive extends StatefulWidget {
  const HomeResponesive({super.key});

  @override
  State<HomeResponesive> createState() => _ResponesiveState();
}

class _ResponesiveState extends State<HomeResponesive> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isShow = MediaQuery.of(context).size.width >= 1100;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (isShow) const SideBar(),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: HomePage(isDrawer: !isShow),
                    ),
                    if (isShow)
                      const Flexible(
                        fit: FlexFit.loose,
                        flex: 3,
                        child: UserProfile(),
                      ),
                  ],
                ),
              )
            ],
          ),
          if (isShow) ...[
            const ButtonResizeSideBar(),
            const ProfileMenuContext(),
          ],
        ],
      ),
    );
  }
}

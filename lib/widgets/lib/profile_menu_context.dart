import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../themes/theme_provider.dart';

class ProfileMenuContext extends StatefulWidget {
  const ProfileMenuContext({
    super.key,
  });

  @override
  State<ProfileMenuContext> createState() => _ProfileMenuContextState();
}

class _ProfileMenuContextState extends State<ProfileMenuContext> {
  final GlobalKey keyProfileMenuContext = GlobalKey();

  bool isShowOptionsDarkMode = false;

  List<String> optionsDarkMode = ["Off", "On", "Auto"];
  late String selectedOptionDarkMode = optionsDarkMode.first;

  late SideBarProvider sideBarProvider =
      Provider.of<SideBarProvider>(context, listen: false);
  late UserSessionProvider userSessionProvider =
      Provider.of<UserSessionProvider>(context, listen: false);
  late UserModel? user = userSessionProvider.user;

  @override
  void initState() {
    super.initState();
    sideBarProvider.addListener(() {
      if (mounted) {
        setState(() {
          isShowOptionsDarkMode = false;
        });
      }
    });

    userSessionProvider.addListener(() {
      setState(() {
        user = userSessionProvider.user;
      });
    });
  }

  @override
  void dispose() {
    sideBarProvider.removeListener(() {});
    userSessionProvider.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (sideBarProvider.positionMenuContext != Offset.zero) {
      return Positioned(
        key: keyProfileMenuContext,
        bottom: sideBarProvider.positionMenuContext.dy,
        left: sideBarProvider.positionMenuContext.dx,
        child: TapRegion(
          onTapOutside: (event) {
            Offset postion = event.position;
            Offset posBtn = sideBarProvider.posBtn;
            Size sizeBtn = sideBarProvider.sizeBtn;
            if ((postion.dy < posBtn.dy ||
                    postion.dy > posBtn.dy + sizeBtn.height) ||
                (postion.dx < posBtn.dx ||
                    postion.dx > posBtn.dx + sizeBtn.width)) {
              sideBarProvider.setPosMenuContext(Offset.zero);
            }
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorScheme.onBackground),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.background,
                    child: Text(
                      user!.avatar,
                      style: TextStyle(color: colorScheme.onSecondary),
                    ),
                  ),
                  title: Text(
                    user!.fullname,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "See profile",
                    style:
                        TextStyle(fontSize: 12, color: colorScheme.secondary),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.background,
                    child: Icon(Icons.settings, color: colorScheme.onSecondary),
                  ),
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      isShowOptionsDarkMode = !isShowOptionsDarkMode;
                    });
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.background,
                    child:
                        Icon(Icons.dark_mode, color: colorScheme.onSecondary),
                  ),
                  title: const Text(
                    "Dark mode",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(isShowOptionsDarkMode
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 100),
                  child: isShowOptionsDarkMode
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              List.generate(optionsDarkMode.length, (index) {
                            String option = optionsDarkMode[index];
                            return SizedBox(
                              height: 40,
                              child: ListTile(
                                onTap: () => setState(() {
                                  bool isDarkMode;
                                  selectedOptionDarkMode = option;
                                  if (index == 2) {
                                    var brightness = View.of(context)
                                        .platformDispatcher
                                        .platformBrightness;
                                    isDarkMode = brightness == Brightness.dark;
                                  } else {
                                    isDarkMode = index == 0 ? false : true;
                                  }
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .toogleTheme(isDarkMode);
                                }),
                                leading: const SizedBox(width: 36),
                                title: Text(option,
                                    style: const TextStyle(fontSize: 14)),
                                trailing: Radio<String>(
                                  value: option,
                                  groupValue: selectedOptionDarkMode,
                                  onChanged: option != selectedOptionDarkMode
                                      ? null
                                      : (value) {},
                                ),
                              ),
                            );
                          }),
                        )
                      : Container(),
                ),
                ListTile(
                  onTap: () => context.go("/login"),
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.background,
                    child: Icon(
                      Icons.logout,
                      color: colorScheme.onSecondary,
                      size: 20,
                    ),
                  ),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }
}

import 'package:chat_app_v_0_2/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarDarkModeOptions extends StatefulWidget {
  const SideBarDarkModeOptions({
    super.key,
    required this.optionSideBar,
    required this.colorScheme,
  });

  final int optionSideBar;
  final ColorScheme colorScheme;

  @override
  State<SideBarDarkModeOptions> createState() => _SideBarDarkModeOptionsState();
}

class _SideBarDarkModeOptionsState extends State<SideBarDarkModeOptions> {
  bool isDarkMode = false;
  bool isAuto = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: widget.optionSideBar == 1
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: widget.colorScheme.onPrimary,
            ),
            child: const Icon(Icons.dark_mode),
          ),
          widget.optionSideBar == 1
              ? Row(
                  children: [
                    Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 2.0, color: widget.colorScheme.primary),
                      ),
                      tristate: true,
                      shape: const CircleBorder(),
                      checkColor: Colors.white,
                      value: isAuto,
                      onChanged: (bool? value) {
                        setState(() {
                          isAuto = !isAuto;
                          if (isAuto) {
                            var brightness = View.of(context)
                                .platformDispatcher
                                .platformBrightness;
                            isDarkMode = brightness == Brightness.dark;
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toogleTheme(isDarkMode);
                          }
                        });
                      },
                    ),
                    Text(
                      "Auto",
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.colorScheme.onSecondary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              : Container(),
          widget.optionSideBar == 1
              ? Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: isDarkMode,
                    activeColor: widget.colorScheme.primary,
                    onChanged: (bool value) {
                      setState(() {
                        isAuto = false;
                        isDarkMode = !isDarkMode;
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toogleTheme(isDarkMode);
                      });
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

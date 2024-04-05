import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../screens/screens.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.isDrawer,
  });

  final bool? isDrawer;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
  late List<BottomNavigationBarItem> bottomNavigationItem =
      sideBarProvider.bottomNavigationItem;

  late List<String> titles = sideBarProvider.titles;

  late List<Icon> iconItem = sideBarProvider.iconItem;

  void _onItemTapped(int index) {
    setState(() {
      Provider.of<SideBarProvider>(context, listen: false)
          .setSelectedScreen(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedScreen = Provider.of<SideBarProvider>(context).selectedScreen;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double maxWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          leading: widget.isDrawer == null ? Container() : null,
          centerTitle: true,
          title: Text(
            titles[selectedScreen],
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: [
          const ChatsScreen(),
          const ContactsScreen(),
          const CallsScreen()
        ][selectedScreen],
        drawer: widget.isDrawer == true
            ? CustomDrawer(
                titles: titles,
                selectedScreen: selectedScreen,
                iconItem: iconItem,
                onItemTapped: _onItemTapped,
              )
            : null,
        bottomNavigationBar: maxWidth < 1100
            ? BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedIconTheme: const IconThemeData(
                  color: Colors.grey,
                ),
                selectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.primary,
                ),
                type: BottomNavigationBarType.fixed,
                items: bottomNavigationItem,
                currentIndex: selectedScreen,
                onTap: _onItemTapped,
              )
            : null,
      ),
    );
  }
}

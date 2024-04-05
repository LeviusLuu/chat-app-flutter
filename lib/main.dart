import 'package:chat_app_v_0_2/models/models.dart';
import 'package:chat_app_v_0_2/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'providers/providers.dart';
import 'responesive/responesive.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserSessionProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserModel? user;

  Future<bool> initStateAsync() async {
    setState(() {
      user = Provider.of<UserSessionProvider>(context).user;
    });
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => user != null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initStateAsync(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            theme: Provider.of<ThemeProvider>(context).themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      name: "home",
      path: '/',
      redirect: (context, state) {
        String? fullPath = state.fullPath;
        if (fullPath != "/message/:id") {
          Provider.of<ChatPageProvider>(context, listen: false)
              .setSelectedChatId("");
        }

        UserModel? user =
            Provider.of<UserSessionProvider>(context, listen: false).user;
        if (user == null) return "/login";
        return null;
      },
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: HomeResponesive(),
        );
      },
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: ContentResponesive(contentWiget: child),
          ),
          routes: [
            GoRoute(
              path: 'message/:id',
              builder: (context, state) {
                String id = state.pathParameters["id"].toString();
                return ChatPage(id: id);
              },
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) {
                return const UserProfile();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const SignInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            double maxWidth = MediaQuery.of(context).size.width;
            return SlideTransition(
              position: Tween<Offset>(
                      begin: Offset(maxWidth <= 500 ? 1 : 0, 0),
                      end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const SignUpPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            double maxWidth = MediaQuery.of(context).size.width;
            return SlideTransition(
              position: Tween<Offset>(
                      begin: Offset(maxWidth <= 500 ? 1 : 0, 0),
                      end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

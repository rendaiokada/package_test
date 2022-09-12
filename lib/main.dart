import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/pages/account_page.dart';
import 'package:package_test/pages/detail_page.dart';
import 'package:package_test/pages/home_page.dart';
import 'package:package_test/pages/search_page.dart';
import 'package:package_test/pages/settings_page.dart';
import 'package:package_test/providers/counter_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  int currentIndex = 0;

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: 'details/:fid',
            builder: (BuildContext context, GoRouterState state) => DetailPage(
              data: state.subloc,
            ),
          ),
          GoRoute(
            path: 'account',
            builder: (BuildContext context, GoRouterState state) =>
                const AccountPage(),
          ),
          GoRoute(
            path: 'search',
            builder: (BuildContext context, GoRouterState state) =>
                const SearchPage(),
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

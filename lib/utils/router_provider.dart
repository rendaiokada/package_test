import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/pages/account_page.dart';
import 'package:package_test/pages/detail_page.dart';
import 'package:package_test/pages/home_page.dart';
import 'package:package_test/pages/login_page.dart';
import 'package:package_test/providers/login_info_provider.dart';

import '../pages/search_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => (GoRouter(
    initialLocation: '/',
    urlPathStrategy: UrlPathStrategy.path,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            name: 'details',
            path: 'details/:fid',
            builder: (BuildContext context, GoRouterState state) => DetailPage(
              data: state.subloc,
            ),
          ),
          GoRoute(
            name: 'account',
            path: 'account',
            builder: (BuildContext context, GoRouterState state) =>
                const AccountPage(),
          ),
          GoRoute(
            name: 'search',
            path: 'search',
            builder: (BuildContext context, GoRouterState state) =>
                const SearchPage(),
          ),
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (BuildContext context, GoRouterState state) =>
                const LoginPage(),
          ),
        ],
      ),
    ],
    redirect: (GoRouterState state) {
      final isLoggedIn = ref.read(loginInfoProvider.notifier).isLoggedIn;
      final isLoggingIn = state.subloc == '/login';
      print(isLoggedIn);

      final fromParam = isLoggingIn ? '' : '?from=${state.subloc}';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        return state.queryParams['from'] ?? '/';
      }

      return null;
    },
  )),
);

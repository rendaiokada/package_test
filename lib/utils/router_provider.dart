import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/pages/account_page.dart';
import 'package:package_test/pages/detail_page.dart';
import 'package:package_test/pages/home_page.dart';
import 'package:package_test/pages/login_page.dart';
import 'package:package_test/providers/login_info_provider.dart';
import 'package:package_test/widgets/bottom_navigation.dart';

import '../pages/search_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => (GoRouter(
    initialLocation: '/',
    urlPathStrategy: UrlPathStrategy.path,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage(
                key: state.pageKey,
                child: HomePage(),
                transitionDuration: Duration.zero,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child),

        routes: [
          GoRoute(
            name: 'details',
            path: 'details/:fid',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                CustomTransitionPage(
                    key: state.pageKey,
                    child: DetailPage(
                      data: state.subloc,
                    ),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) => child),
          ),
          GoRoute(
            name: 'account',
            path: 'account',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                CustomTransitionPage(
                    key: state.pageKey,
                    child: const AccountPage(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) => child),
          ),
          GoRoute(
            name: 'search',
            path: 'search',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                CustomTransitionPage(
                    key: state.pageKey,
                    child:  SearchPage(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) => child),
          ),
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                CustomTransitionPage(
                    key: state.pageKey,
                    child: LoginPage(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) => child),
          ),
        ],
      ),
    ],
    navigatorBuilder: (context, state, child) {
      return Navigator(
        onPopPage: (route, dynamic __) => false,
        pages: [
          MaterialPage<Widget>(
            child: BottomNav(
              child: child,
            ),
          ),
        ],
      );
    },
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

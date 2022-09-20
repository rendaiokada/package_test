import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_test/providers/bottom_navigation_provider.dart';

class BottomNav extends ConsumerStatefulWidget {
  const BottomNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(bottomNavIndexProvider),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'アカウント'),
              ],
              onTap: (i) {
                ref.read(bottomNavIndexProvider.notifier).update((state) => i);
                // indexに応じてGoRouterのページに遷移
                switch (i) {
                  case 0:
                    context.go('/');
                    break;
                  case 1:
                    context.go('/search');
                    break;
                  case 2:
                    context.go('/account');
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

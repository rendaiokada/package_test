import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/utils/login_info_provider.dart';
import 'package:package_test/main.dart';
import 'package:package_test/utils/router_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('ログインしてください')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  child: Text('ログインする'),
                  onPressed: () {
                    ref.read(loginInfoProvider.notifier).login();
                    ref.read(loginInfoProvider.notifier).refresh();
                  }),
            ),
            Center(
              child: ElevatedButton(
                  child: Text('ログアウトする'),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () {
                    ref.read(loginInfoProvider.notifier).logout();
                    ref.read(loginInfoProvider.notifier).refresh();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

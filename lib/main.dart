import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/providers/login_info_provider.dart';
import 'package:package_test/utils/router_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting('ja');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // Shared Preferenceからデータを取得
    ref.read(loginInfoProvider).init();

    // loginInfoProviderに変更があった場合にrouterをrefreshする
    ref.listen(loginInfoProvider, (_, __) {
      router.refresh();
    });

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'GoRouter Test',
    );
  }
}

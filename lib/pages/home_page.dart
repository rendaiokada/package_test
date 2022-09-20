import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Container(
            child: ListTile(
              title: Text('title1'),
              leading: Icon(Icons.router),
              onTap: () {
                context.goNamed('details', params: {'fid': 'title1'});
              },
            ),
          )),
    );
  }
}

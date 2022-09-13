import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginInfoProvider = ChangeNotifierProvider<LoginInfoProvider>(
    (ref) => LoginInfoProvider(false));

class LoginInfoProvider extends ChangeNotifier {
  LoginInfoProvider(this.isLoggedIn) : super();

  bool isLoggedIn;

  void init() async {
    await Future.delayed(Duration(seconds: 3));
    isLoggedIn = true;
    refresh();
  }

  void refresh() {
    notifyListeners();
  }

  void login() {
    print('User Logged In');
    isLoggedIn = true;
  }

  void logout() {
    print('User Logged Out');
    isLoggedIn = false;
  }
}

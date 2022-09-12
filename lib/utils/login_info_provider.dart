import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/models/login_info.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_test/utils/login_info_provider.dart';

import '../models/login_info.dart';

final loginInfoProvider = ChangeNotifierProvider<LoginInfoProvider>(
        (ref) => LoginInfoProvider(ref.read, false));

class LoginInfoProvider extends ChangeNotifier {
  LoginInfoProvider(this._read, this.isLoggedIn) : super();

  bool isLoggedIn;
  final Reader _read;

  void refresh(){
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

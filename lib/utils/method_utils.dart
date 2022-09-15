import 'package:flutter/material.dart';

class MethodUtils {

  static int imageCount = 0;

  static helloWorld() {
    print('say hello world');
  }

  static Widget buildContainer() {
    return Container(child: Column(children: [
      Text('テスト'),
      Text('テスト')
    ],),);
  }
}
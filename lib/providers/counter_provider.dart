import 'package:riverpod/riverpod.dart';

final counterProvider = StateNotifierProvider((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter(): super(0);
  void increment() => state++;
}


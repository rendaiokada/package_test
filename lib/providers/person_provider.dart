import 'package:riverpod/riverpod.dart';

import '../models/person.dart';

final personProvider = StateNotifierProvider((ref) {
  return CurrentPerson();
});

class CurrentPerson extends StateNotifier<Person> {
  CurrentPerson()
      : super(const Person(firstName: 'none', lastName: '', age: 10));

  void incrementAge() {
    
  }
}

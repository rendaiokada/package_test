import 'package:riverpod/riverpod.dart';

import '../models/person_model.dart';

final personProvider = StateNotifierProvider((ref) {
  return CurrentPerson();
});

class CurrentPerson extends StateNotifier<PersonModel> {
  CurrentPerson()
      : super(const PersonModel(firstName: 'none', lastName: '', age: 10));

  void incrementAge() {

  }
}

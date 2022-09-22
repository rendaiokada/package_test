import 'package:isar/isar.dart';
import 'package:package_test/collections/person.dart';
import 'package:package_test/models/person_model.dart';

class IsarController {
  static Future<List<Person?>> getAllPerson(List<int> ids) async {
    final isar = await Isar.open([PersonSchema]);

    List<Person?> persons = await isar.persons.getAll(ids);
    return persons;
  }
}

import 'package:isar/isar.dart';

part 'person.g.dart';

@Collection()
class Person {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late int age;
}

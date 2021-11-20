import 'package:hive/hive.dart';
part 'people.g.dart';

@HiveType(typeId: 1)
class People {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String country;

  People({
    required this.name,
    required this.country,
  });
}

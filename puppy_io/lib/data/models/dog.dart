import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@JsonSerializable()
class Dog {
  final String photoUrl;
  final String name;
  final int age;
  final String gender;
  final String description;

  Dog(this.photoUrl, this.name, this.age, this.gender, this.description);

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

  Map<String, dynamic> toJson() => _$DogToJson(this);
}

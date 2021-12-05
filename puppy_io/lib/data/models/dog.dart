import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@JsonSerializable()
class DogOffer {
  final String photoUrl;
  final String name;
  final int age;
  final String gender;
  final String description;

  DogOffer(this.photoUrl, this.name, this.age, this.gender, this.description);

  factory DogOffer.fromJson(Map<String, dynamic> json) => _$DogOfferFromJson(json);

  Map<String, dynamic> toJson() => _$DogOfferToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';

part 'search_for_dog.g.dart';

@JsonSerializable()
class SearchForDog {
  final Age age;
  final String breed;
  final Sex sex;
  final Distance distance;

  SearchForDog(this.age, this.breed, this.sex, this.distance);

  factory SearchForDog.fromJson(Map<String, dynamic> json) => _$SearchForDogFromJson(json);

  Map<String, dynamic> toJson() => _$SearchForDogToJson(this);
}

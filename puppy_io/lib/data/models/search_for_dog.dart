import 'package:json_annotation/json_annotation.dart';

part 'search_for_dog.g.dart';

@JsonSerializable()
class SearchForDog {
  final int? ageLow;
  final int? ageHight;
  final String? breed;
  final bool? isMale;
  final int? localizationRange;
  final List<double>? localization;

  SearchForDog({
    this.breed,
    this.localization,
    this.isMale,
    this.ageLow,
    this.ageHight,
    this.localizationRange,
  });

  factory SearchForDog.fromJson(Map<String, dynamic> json) => _$SearchForDogFromJson(json);

  Map<String, dynamic> toJson() => _$SearchForDogToJson(this);
}

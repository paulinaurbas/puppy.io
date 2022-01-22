import 'package:json_annotation/json_annotation.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';

part 'create_dog_offer.g.dart';

@JsonSerializable()
class CreateNewOfferModel {
  final int age;
  final String breed;
  final Sex sex;
  final List<double> localization;
  final String description;
  final List<String> pictures;

  CreateNewOfferModel(this.age, this.breed, this.sex, this.localization,
      this.description, this.pictures);

  factory CreateNewOfferModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewOfferModelToJson(this);
}

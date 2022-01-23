// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dog_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewOfferModel _$CreateNewOfferModelFromJson(Map<String, dynamic> json) =>
    CreateNewOfferModel(
      json['name'] as String,
      json['age'] as int,
      json['breed'] as String,
      $enumDecode(_$SexEnumMap, json['sex']),
      (json['localization'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      json['description'] as String,
      (json['pictures'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateNewOfferModelToJson(
        CreateNewOfferModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'breed': instance.breed,
      'sex': _$SexEnumMap[instance.sex],
      'localization': instance.localization,
      'description': instance.description,
      'pictures': instance.pictures,
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
};

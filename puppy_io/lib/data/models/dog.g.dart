// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogOffer _$DogOfferFromJson(Map<String, dynamic> json) => DogOffer(
      (json['pictures'] as List<dynamic>).map((e) => e as String).toList(),
      json['name'] as String,
      json['age'] as int,
      json['sex'] as String,
      json['breed'] as String,
      json['description'] as String,
      json['ownerEmail'] as String,
    );

Map<String, dynamic> _$DogOfferToJson(DogOffer instance) => <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'breed': instance.breed,
      'description': instance.description,
      'ownerEmailAddress': instance.ownerEmailAddress,
    };

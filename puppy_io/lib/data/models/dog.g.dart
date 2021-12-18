// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogOffer _$DogOfferFromJson(Map<String, dynamic> json) => DogOffer(
      json['photoUrl'] as String,
      json['name'] as String,
      json['age'] as int,
      json['gender'] as String,
      json['description'] as String,
      json['ownerEmailAddress'] as String,
    );

Map<String, dynamic> _$DogOfferToJson(DogOffer instance) => <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'description': instance.description,
      'ownerEmailAddress': instance.ownerEmailAddress,
    };

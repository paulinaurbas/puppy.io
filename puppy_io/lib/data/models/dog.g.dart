// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dog _$DogFromJson(Map<String, dynamic> json) => Dog(
      json['photoUrl'] as String,
      json['name'] as String,
      json['age'] as int,
      json['gender'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$DogToJson(Dog instance) => <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'description': instance.description,
    };

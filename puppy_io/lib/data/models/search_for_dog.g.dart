// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_for_dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchForDog _$SearchForDogFromJson(Map<String, dynamic> json) => SearchForDog(
      $enumDecode(_$AgeEnumMap, json['age']),
      json['breed'] as String,
      $enumDecode(_$SexEnumMap, json['sex']),
      $enumDecode(_$DistanceEnumMap, json['distance']),
    );

Map<String, dynamic> _$SearchForDogToJson(SearchForDog instance) => <String, dynamic>{
      'age': _$AgeEnumMap[instance.age],
      'breed': instance.breed,
      'sex': _$SexEnumMap[instance.sex],
      'distance': _$DistanceEnumMap[instance.distance],
    };

const _$AgeEnumMap = {
  Age.oneTwoYears: 'oneTwoYears',
  Age.threeSixYears: 'threeSixYears',
  Age.sixPlusYear: 'sixPlusYear',
};

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
};

const _$DistanceEnumMap = {
  Distance.tenKm: 'tenKm',
  Distance.twentyKm: 'twentyKm',
  Distance.moreThanThirtyKm: 'moreThanThirtyKm',
};

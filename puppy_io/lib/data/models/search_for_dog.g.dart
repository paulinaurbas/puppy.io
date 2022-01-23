// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_for_dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchForDog _$SearchForDogFromJson(Map<String, dynamic> json) => SearchForDog(
      breed: json['breed'] as String?,
      localization: (json['localization'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      isMale: json['isMale'] as bool?,
      ageLow: json['ageLow'] as int?,
      ageHight: json['ageHight'] as int?,
      localizationRange: json['localizationRange'] as int?,
    );

Map<String, dynamic> _$SearchForDogToJson(SearchForDog instance) =>
    <String, dynamic>{
      'ageLow': instance.ageLow,
      'ageHight': instance.ageHight,
      'breed': instance.breed,
      'isMale': instance.isMale,
      'localizationRange': instance.localizationRange,
      'localization': instance.localization,
    };

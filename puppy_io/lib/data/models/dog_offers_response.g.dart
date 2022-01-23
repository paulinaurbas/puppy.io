// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogOfferResponse _$DogOfferResponseFromJson(Map<String, dynamic> json) =>
    DogOfferResponse(
      (json['offers'] as List<dynamic>)
          .map((e) => DogOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DogOfferResponseToJson(DogOfferResponse instance) =>
    <String, dynamic>{
      'offers': instance.dogOffers,
    };

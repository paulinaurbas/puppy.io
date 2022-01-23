// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogOfferResponse _$DogOfferResponseFromJson(Map<String, dynamic> json) =>
    DogOfferResponse(
      (json['dogOffers'] as List<dynamic>)
          .map((e) => DogOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DogOfferResponseToJson(DogOfferResponse instance) =>
    <String, dynamic>{
      'dogOffers': instance.dogOffers,
    };

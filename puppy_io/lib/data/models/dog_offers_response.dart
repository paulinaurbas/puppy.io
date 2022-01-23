import 'package:json_annotation/json_annotation.dart';
import 'package:puppy_io/data/models/dog.dart';

part 'dog_offers_response.g.dart';

@JsonSerializable()
class DogOfferResponse {
  List<DogOffer> dogOffers;
  DogOfferResponse(this.dogOffers);

  factory DogOfferResponse.fromJson(Map<String, dynamic> json) => _$DogOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DogOfferResponseToJson(this);
}
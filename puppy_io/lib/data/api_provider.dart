import 'package:dio/dio.dart';
import 'package:puppy_io/data/models/create_dog_offer.dart';
import 'package:puppy_io/data/models/dog_offers_response.dart';
import 'package:puppy_io/data/models/search_for_dog.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<DogOfferResponse> getDogsOffers(SearchForDog searchForDog) async {
    return _dio.post('https://puppy-io.herokuapp.com/dogOffers',data: searchForDog.toJson()).then((value) {
      return DogOfferResponse.fromJson(value.data);
    });
  }

  Future<DogOfferResponse> userOffers(String userName) async {
    return _dio.post('https://puppy-io.herokuapp.com/dogOffers/$userName').then((value) {
      return DogOfferResponse.fromJson(value.data);
    });
  }

  Future<int> createNewOffer(CreateNewOfferModel createNewOfferPayload) async {
    return 201; // Successfully created a dog offer
  }
}

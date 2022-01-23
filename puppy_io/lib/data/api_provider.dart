import 'package:dio/dio.dart';
import 'package:puppy_io/data/models/create_dog_offer.dart';
import 'package:puppy_io/data/models/dog_offers_response.dart';
import 'package:puppy_io/data/models/search_for_dog.dart';
import 'package:puppy_io/screens/autorization_screen/login/models/username.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<DogOfferResponse> getDogsOffers(SearchForDog searchForDog) async {
    return _dio
        .post('https://puppy-io.herokuapp.com/dogOffers',
            data: searchForDog.toJson())
        .then((value) {
      return DogOfferResponse.fromJson(value.data);
    });
  }

  Future<DogOfferResponse> userOffers(String userName) async {
    return _dio
        .get('https://puppy-io.herokuapp.com/dogOffersByOwner/$userName')
        .then((value) {
      return DogOfferResponse.fromJson(value.data);
    });
  }

  Future<int> createNewOffer(
      CreateNewOfferModel createNewOfferPayload, String userName) async {
    return _dio
        .post('https://puppy-io.herokuapp.com/dogOffer',
            data: createNewOfferPayload.toJson(),
            options: Options(headers: {'username': userName}))
        .then((value) {
      return value.statusCode ?? 500;
    });
  }
  Future<int> updateNewOffer(
      CreateNewOfferModel createNewOfferPayload, String userName, String id) async {
    return _dio
        .put('https://puppy-io.herokuapp.com/dogOffer/$id',
        data: createNewOfferPayload.toJson(),
        options: Options(headers: {'username': userName}))
        .then((value) {
      return value.statusCode ?? 500;
    });
  }

  Future<int> deleteOffer(int offerID, String userName) async {
    return _dio
        .delete('https://puppy-io.herokuapp.com/dogOffer/$offerID',
            options: Options(headers: {'username': userName}))
        .then((value) {
      return value.statusCode ?? 500;
    });
  }
}

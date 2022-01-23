import 'package:puppy_io/data/api_provider.dart';
import 'package:puppy_io/data/models/create_dog_offer.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/models/search_for_dog.dart';
import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:puppy_io/screens/home/create_new_offer/view/create_new_offer_form.dart';

class Repository {
  final ApiProvider apiProvider;
  final SharedPreferencesHelper _preferencesHelper;

  Repository(
    this.apiProvider,
    this._preferencesHelper,
  );

  Future<List<DogOffer>> searchForOffers(SearchForDog searchForDog) async {
    try {
      final listWithDogs = await apiProvider.getDogsOffers(searchForDog);
      return listWithDogs.dogOffers;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DogOffer>> userOffers() async {
    try {
      final userName = await _preferencesHelper
          .getStringPreference(SharedPreferencesHelper.userName);
      final listWithDogs = await apiProvider.userOffers(userName!);
      return listWithDogs.dogOffers;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> createNewOffer(CreateNewOfferModel createNewOfferPayload) async {
    try {
      final userName = await _preferencesHelper
          .getStringPreference(SharedPreferencesHelper.userName);
      final statusCode =
          await apiProvider.createNewOffer(createNewOfferPayload, userName!);
      return statusCode;
    } catch (e) {
      print(e);
      return 500;
    }
  }

  Future<int> updateOffer(CreateNewOfferModel createNewOfferPayload, int offerId) async {
    try {
      final userName = await _preferencesHelper
          .getStringPreference(SharedPreferencesHelper.userName);
      final statusCode =
      await apiProvider.updateNewOffer(createNewOfferPayload, userName!, offerId.toString());
      return statusCode;
    } catch (e) {
      print(e);
      return 500;
    }
  }

  Future<int> deleteOffer(int offerID) async {
    try {
      final userName = await _preferencesHelper
          .getStringPreference(SharedPreferencesHelper.userName);
      final statusCode = await apiProvider.deleteOffer(offerID, userName!);
      return statusCode;
    } catch (e) {
      print(e);
      return 500;
    }
  }
}

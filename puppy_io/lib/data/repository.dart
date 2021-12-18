import 'package:puppy_io/data/api_provider.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/models/search_for_dog.dart';

class Repository {
  final ApiProvider apiProvider;

  Repository(this.apiProvider);

  Future<List<DogOffer>> getDogsOffers() async {
    return [];
  }

  Future<List<DogOffer>> searchForOffers(SearchForDog searchForDog) async {
    List<DogOffer> listWithDogs = [];
    listWithDogs.add(
      DogOffer(
          [
        'https://images.pexels.com/photos/7210704/pexels-photo-7210704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
      ], "Hasanka", 2, "Women", "Cute dog", "test@test.com"),
    );
    listWithDogs.add(
      DogOffer(
          [
        'https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ], "Hasanka", 2, "Women", "Cute dog", "test@test.com"),
    );

    listWithDogs.add(
      DogOffer(
          [
        'https://images.pexels.com/photos/97082/weimaraner-puppy-dog-snout-97082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
      ], "Hasanka", 2, "Women", "Cute dog", "test@test.com"),
    );

    return listWithDogs;
  }
}

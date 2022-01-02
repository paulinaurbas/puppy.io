part of 'create_new_offer_bloc.dart';

//TODO: Clean it up
class CreateNewOfferState {
  const CreateNewOfferState();
}

class FilteringOfferDogsState extends CreateNewOfferState {
  const FilteringOfferDogsState({
    required this.age,
    required this.breed,
    required this.sex,
    required this.distance,
    required this.listWithDogs,
  });

  final Age? age;
  final String? breed;
  final Sex? sex;
  final Distance? distance;
  final List<DogOffer> listWithDogs;

  FilteringOfferDogsState copyWith(
      {Age? age,
      String? breed,
      Sex? sex,
      Distance? distance,
      List<DogOffer>? listWithDogs}) {
    return FilteringOfferDogsState(
      distance: distance ?? this.distance,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      listWithDogs: listWithDogs ?? this.listWithDogs,
    );
  }
}

class LoadingScreenMainState extends CreateNewOfferState {
  const LoadingScreenMainState();
}

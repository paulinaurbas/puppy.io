part of 'home_screen_main_bloc.dart';

class HomeScreenMainState {
  const HomeScreenMainState();
}

class FilteringOfferDogsState extends HomeScreenMainState {
  const FilteringOfferDogsState({
    required this.age,
    required this.breed,
    required this.sex,
    required this.distance,
    required this.listWithDogs,
    this.position,
  });

  final Age? age;
  final String? breed;
  final Position? position;
  final Sex? sex;
  final Distance? distance;
  final List<DogOffer> listWithDogs;

  FilteringOfferDogsState copyWith({
    Age? age,
    String? breed,
    Sex? sex,
    Distance? distance,
    List<DogOffer>? listWithDogs,
    Position? position,
  }) {
    return FilteringOfferDogsState(
      distance: distance ?? this.distance,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      listWithDogs: listWithDogs ?? this.listWithDogs,
      position: position ?? this.position,
    );
  }
}

class LoadingScreenMainState extends HomeScreenMainState {
  const LoadingScreenMainState();
}

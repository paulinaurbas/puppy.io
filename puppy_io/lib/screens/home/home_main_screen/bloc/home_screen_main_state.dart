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
    this.isFirstScreen = false,
    this.position,
    this.isLoading = false,
  });

  final Age? age;
  final String? breed;
  final Position? position;
  final bool isLoading;
  final Sex? sex;
  final Distance? distance;
  final bool isFirstScreen;
  final List<DogOffer> listWithDogs;

  FilteringOfferDogsState copyWith({
    Age? age,
    String? breed,
    Sex? sex,
    Distance? distance,
    List<DogOffer>? listWithDogs,
    Position? position,
    bool? isFirstScreen,
    bool? isLoading,
  }) {
    return FilteringOfferDogsState(
      isLoading: isLoading ?? this.isLoading,
      distance: distance ?? this.distance,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      listWithDogs: listWithDogs ?? this.listWithDogs,
      position: position ?? this.position,
      isFirstScreen: isFirstScreen ?? this.isFirstScreen,
    );
  }
}

class LoadingScreenMainState extends HomeScreenMainState {
  const LoadingScreenMainState();
}

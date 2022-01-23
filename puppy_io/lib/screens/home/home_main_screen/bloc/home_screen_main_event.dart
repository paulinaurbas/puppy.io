part of 'home_screen_main_bloc.dart';

abstract class HomeScreenMainEvent {
  const HomeScreenMainEvent();
}

class InitMainScreen extends HomeScreenMainEvent {}

class DogBreedChanged extends HomeScreenMainEvent {
  const DogBreedChanged(this.breed);

  final String breed;
}

class DogSexChanged extends HomeScreenMainEvent {
  const DogSexChanged(this.sex);

  final Sex sex;
}

class DogAgeChanged extends HomeScreenMainEvent {
  final Age age;

  const DogAgeChanged(this.age);
}

class DogDistanceChanged extends HomeScreenMainEvent {
  final Distance distance;

  const DogDistanceChanged(this.distance);
}

class SearchDog extends HomeScreenMainEvent {
  SearchDog();
}

class CleanFilthers extends HomeScreenMainEvent {
  CleanFilthers();
}

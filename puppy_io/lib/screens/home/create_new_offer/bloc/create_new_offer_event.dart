part of 'create_new_offer_bloc.dart';

//TODO: Clean it up
abstract class CreateNewOfferEvent {
  const CreateNewOfferEvent();
}

class InitMainScreen extends CreateNewOfferEvent {}

class DogBreedChanged extends CreateNewOfferEvent {
  const DogBreedChanged(this.breed);

  final String breed;
}

class DogSexChanged extends CreateNewOfferEvent {
  const DogSexChanged(this.sex);

  final Sex sex;
}

class DogAgeChanged extends CreateNewOfferEvent {
  final Age age;

  const DogAgeChanged(this.age);
}

class DogDistanceChanged extends CreateNewOfferEvent {
  final Distance distance;

  const DogDistanceChanged(this.distance);
}

class SearchDog extends CreateNewOfferEvent {
  SearchDog();
}

class CreateNewOffer extends CreateNewOfferEvent {
  CreateNewOffer();
}

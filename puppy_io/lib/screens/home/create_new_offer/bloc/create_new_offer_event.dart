part of 'create_new_offer_bloc.dart';

abstract class CreateNewOfferEvent {
  const CreateNewOfferEvent();
}

class InitCreateNewOfferScreen extends CreateNewOfferEvent {
  final DogOffer? arg;

  InitCreateNewOfferScreen(this.arg);
}

class DogNameChanged extends CreateNewOfferEvent {
  final String name;
  const DogNameChanged(this.name);
}

class DogBreedChanged extends CreateNewOfferEvent {
  final String breed;
  const DogBreedChanged(this.breed);
}

class DogSexChanged extends CreateNewOfferEvent {
  final Sex sex;
  const DogSexChanged(this.sex);
}

class DogAgeChanged extends CreateNewOfferEvent {
  final int age;
  const DogAgeChanged(this.age);
}

class DogDistanceChanged extends CreateNewOfferEvent {
  final Distance distance;
  const DogDistanceChanged(this.distance);
}

class DogDescriptionChanged extends CreateNewOfferEvent {
  final String description;
  const DogDescriptionChanged(this.description);
}

class DogPicturesChanged extends CreateNewOfferEvent {
  final String picture;
  final int pictureIndex;
  const DogPicturesChanged(this.picture, this.pictureIndex);
}

class DogLocalizationChanged extends CreateNewOfferEvent {
  final List<double> localization;
  const DogLocalizationChanged(this.localization);
}

class CreateNewOffer extends CreateNewOfferEvent {
  CreateNewOffer();
}

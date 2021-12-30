part of 'dog_details_bloc.dart';

class DogDetailsState {
  const DogDetailsState();
}

class LoadingDogDetailsState extends DogDetailsState {
  const LoadingDogDetailsState();
}

class DogDetailsLoaded extends DogDetailsState {
  const DogDetailsLoaded(this.dogOffer);

  final DogOffer dogOffer;
}

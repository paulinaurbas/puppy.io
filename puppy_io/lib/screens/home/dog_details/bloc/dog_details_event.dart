part of 'dog_details_bloc.dart';

abstract class DogDetailsEvent {
  const DogDetailsEvent();
}

class InitMainScreen extends DogDetailsEvent {
  final DogDetailsArg arg;

  InitMainScreen(this.arg);
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';
import 'package:puppy_io/data/models/create_dog_offer.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/repository.dart';

part 'create_new_offer_event.dart';
part 'create_new_offer_state.dart';

class CreateNewOfferBloc
    extends Bloc<CreateNewOfferEvent, CreateNewOfferState> {
  CreateNewOfferBloc({
    required Repository repository,
  })  : _repository = repository,
        super(const CreatingNewOfferState(
            age: null,
            sex: null,
            breed: '',
            description: '',
            localization: [],
            pictures: ['', '', '']));

  final Repository _repository;

  @override
  Stream<CreateNewOfferState> mapEventToState(
    CreateNewOfferEvent event,
  ) async* {
    if (event is InitCreateNewOfferScreen) {
      yield const CreatingNewOfferState(
          age: null,
          sex: null,
          breed: '',
          description: '',
          localization: [],
          pictures: ['', '', '']);
    } else if (event is DogAgeChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState).copyWith(age: event.age);
    } else if (event is DogBreedChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState)
          .copyWith(breed: event.breed);
    } else if (event is DogSexChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState).copyWith(sex: event.sex);
    } else if (event is DogDescriptionChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState)
          .copyWith(description: event.description);
    } else if (event is DogPicturesChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      var pictures =
          List<String>.from((currentState as CreatingNewOfferState).pictures!);
      pictures[event.pictureIndex] = event.picture;
      yield (currentState as CreatingNewOfferState)
          .copyWith(pictures: pictures);
    } else if (event is DogLocalizationChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState)
          .copyWith(localization: event.localization);
    } else if (event is CreateNewOffer) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;

      final createNewOfferModel = CreateNewOfferModel(
        (currentState as CreatingNewOfferState).age ?? 0,
        currentState.breed ?? '',
        currentState.sex ?? Sex.male,
        currentState.localization ?? [],
        currentState.description ?? '',
        currentState.pictures ?? [],
      );

      final response = await _repository.createNewOffer(createNewOfferModel);
      // TODO: Schould we return to the main screen with the refreshed list of offers?
    }
  }
}

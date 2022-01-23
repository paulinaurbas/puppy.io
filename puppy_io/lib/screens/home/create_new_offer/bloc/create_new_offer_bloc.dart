import 'package:bloc/bloc.dart';
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
            name: '',
            age: null,
            sex: null,
            breed: '',
            description: '',
            localization: [],
            pictures: ['', '', ''],
            offerID: -1));

  final Repository _repository;

  @override
  Stream<CreateNewOfferState> mapEventToState(
    CreateNewOfferEvent event,
  ) async* {
    if (event is InitCreateNewOfferScreen) {
      if (event.arg == null) {
        yield const CreatingNewOfferState(
            name: '',
            age: null,
            sex: null,
            breed: '',
            description: '',
            localization: [],
            pictures: ['', '', ''],
            offerID: -1);
      } else {
        var pic = ['', '', ''];
        for (var i = 0; i < event.arg!.photoUrl.length; i++) {
          pic[i] = event.arg!.photoUrl[i];
        }

        yield CreatingNewOfferState(
            name: event.arg!.name,
            age: event.arg!.age,
            sex: stringToSex(event.arg!.gender),
            breed: event.arg!.breed,
            description: event.arg!.description,
            localization: [],
            pictures: pic,
            offerID: event.arg!.id);
      }
    } else if (event is DogAgeChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState).copyWith(age: event.age);
    } else if (event is DogBreedChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState)
          .copyWith(breed: event.breed);
    } else if (event is DogNameChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState).copyWith(name: event.name);
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
      yield currentState.copyWith(pictures: pictures);
    } else if (event is DogLocalizationChanged) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;
      yield (currentState as CreatingNewOfferState)
          .copyWith(localization: event.localization);
    } else if (event is OfferDeleted) {
      if (state is! CreatingNewOfferState) return;
      final response = await _repository.deleteOffer(event.offerID);
      if (response == 204) {
        yield SuccessfulCreatedOfferState();
      } else {
        yield ErrorCreatedOfferState();
      }
    } else if (event is CreateNewOffer) {
      if (state is! CreatingNewOfferState) return;
      final currentState = state;

      final createNewOfferModel = CreateNewOfferModel(
        (currentState as CreatingNewOfferState).name ?? '',
        currentState.age ?? 0,
        currentState.breed ?? '',
        currentState.sex ?? Sex.male,
        currentState.localization ?? [],
        currentState.description ?? '',
        currentState.pictures ?? ['', '', ''],
      );

      final response = (currentState.offerID != -1)
          ? await _repository.updateOffer(
              createNewOfferModel,
              currentState.offerID!,
            )
          : await _repository.createNewOffer(createNewOfferModel);
      if (response == 204 || response == 201) {
        yield SuccessfulCreatedOfferState();
      } else {
        yield ErrorCreatedOfferState();
        yield currentState;
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/models/search_for_dog.dart';
import 'package:puppy_io/data/repository.dart';

part 'home_screen_main_event.dart';

part 'home_screen_main_state.dart';

class HomeScreenMainBloc extends Bloc<HomeScreenMainEvent, HomeScreenMainState> {
  HomeScreenMainBloc({
    required Repository repository,
  })  : _repository = repository,
        super(const LoadingScreenMainState());

  final Repository _repository;

  @override
  Stream<HomeScreenMainState> mapEventToState(
    HomeScreenMainEvent event,
  ) async* {
    if (event is InitMainScreen) {
      final dogOffers = await _repository.getDogsOffers();
      yield FilteringOfferDogsState(listWithDogs: dogOffers, age: null, sex: null, distance: null, breed: '');
    } else if (event is DogAgeChanged) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;
      yield (currentState as FilteringOfferDogsState).copyWith(age: event.age);
    } else if (event is DogBreedChanged) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;
      yield (currentState as FilteringOfferDogsState).copyWith(breed: event.breed);
    } else if (event is DogSexChanged) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;
      yield (currentState as FilteringOfferDogsState).copyWith(sex: event.sex);
    } else if (event is DogDistanceChanged) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;
      yield (currentState as FilteringOfferDogsState).copyWith(distance: event.distance);
    } else if (event is SearchDog) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;

      final searchForDog = SearchForDog(
        (currentState as FilteringOfferDogsState).age ?? Age.oneTwoYears,
        currentState.breed ?? '',
        currentState.sex ?? Sex.male,
        currentState.distance ?? Distance.twentyKm,
      );

      if (state is! FilteringOfferDogsState) return;

      final dogOffers = await _repository.searchForOffers(searchForDog);

      yield currentState.copyWith(listWithDogs: dogOffers);
    }
  }
}

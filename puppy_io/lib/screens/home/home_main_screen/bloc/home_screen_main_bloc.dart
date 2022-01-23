import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
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
      yield const FilteringOfferDogsState(
        listWithDogs: [],
        age: null,
        sex: null,
        distance: null,
        breed: '',
        isFirstScreen: true,
      );
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
      final LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
        final Position position = await Geolocator.getCurrentPosition().timeout(const Duration(seconds: 5));
        yield (currentState as FilteringOfferDogsState).copyWith(distance: event.distance, position: position);
      } else {
        yield (currentState as FilteringOfferDogsState).copyWith(distance: event.distance);
      }
    } else if (event is SearchDog) {
      if (state is! FilteringOfferDogsState) return;
      final currentState = state;

      List<double> listWithLatLon = [];

      if ((currentState as FilteringOfferDogsState).position != null) {
        listWithLatLon = [];
        listWithLatLon.add(currentState.position!.latitude);
        listWithLatLon.add(currentState.position!.longitude);
      }

      final searchForDog = SearchForDog(
        ageLow: getLowAge((currentState).age),
        ageHight: getHighAge(currentState.age),
        breed: currentState.breed,
        localizationRange: getDistance(currentState.distance),
        localization: listWithLatLon,
        isMale: getIsFemale(currentState.sex),
      );

      if (state is! FilteringOfferDogsState) return;

      final dogOffers = await _repository.searchForOffers(searchForDog,);

      yield currentState.copyWith(listWithDogs: dogOffers, isFirstScreen: false,);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/repository.dart';
import 'package:puppy_io/screens/home/dog_details/view/dog_details_screen_page.dart';

part 'dog_details_event.dart';

part 'dog_details_state.dart';

class DogDetailsBloc extends Bloc<DogDetailsEvent, DogDetailsState> {
  DogDetailsBloc({
    required Repository repository,
  })  : _repository = repository,
        super(const LoadingDogDetailsState());

  final Repository _repository;

  @override
  Stream<DogDetailsState> mapEventToState(DogDetailsEvent event) async* {
    if (event is InitMainScreen) {
      yield DogDetailsLoaded(event.arg.dogOffer);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:puppy_io/auth/user_repository.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/data/models/user.dart';
import 'package:puppy_io/data/repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required Repository repository,
    required UserRepository userRepository,
  })  : _repository = repository,
        _userRepository = userRepository,
        super(const LoadingSettingsState());

  final Repository _repository;
  final UserRepository _userRepository;

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is InitMainScreen) {
      final user = await _userRepository.getUser();
      final dogOffers = await _repository.userOffers();

      yield SettingsLoaded(
        user: user!,
        listWithDogs: dogOffers,
      );
    }
  }
}

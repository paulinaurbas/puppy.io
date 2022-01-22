part of 'settings_bloc.dart';

class SettingsState {
  const SettingsState();
}

class LoadingSettingsState extends SettingsState {
  const LoadingSettingsState();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded({
    required this.user,
    required this.listWithDogs,
  });

  final List<DogOffer> listWithDogs;
  final User user;
}

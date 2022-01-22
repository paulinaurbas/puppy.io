part of 'settings_bloc.dart';

class SettingsState {
  const SettingsState();
}

class LoadingSettingsState extends SettingsState {
  const LoadingSettingsState();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded(this.user);

  final User user;
}

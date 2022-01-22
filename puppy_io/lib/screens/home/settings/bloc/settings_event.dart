part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class InitMainScreen extends SettingsEvent {
  InitMainScreen();
}

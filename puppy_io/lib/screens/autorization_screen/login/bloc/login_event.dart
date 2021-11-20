part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

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

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;
}

class ChangedPageEvent extends LoginEvent {
  const ChangedPageEvent();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class RegisterSubmitted extends LoginEvent {
  const RegisterSubmitted();
}
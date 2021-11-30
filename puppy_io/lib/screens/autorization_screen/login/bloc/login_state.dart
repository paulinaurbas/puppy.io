part of 'login_bloc.dart';

class LoginState {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.registration = false
  });

  final FormzStatus status;
  final Username? username;
  final Password password;
  final Email email;
  final bool registration;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    Email? email,
    bool? registration,
  }) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        registration: registration ?? this.registration
    );
  }

}

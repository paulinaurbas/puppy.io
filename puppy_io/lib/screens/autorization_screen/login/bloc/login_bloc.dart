import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:puppy_io/auth/auth_repository.dart';
import 'package:puppy_io/screens/autorization_screen/login/models/email.dart';
import 'package:puppy_io/screens/autorization_screen/login/models/password.dart';
import 'package:puppy_io/screens/autorization_screen/login/models/username.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmittedLogin);
    on<RegisterSubmitted>(_onSubmittedRegistration);
    on<ChangedPageEvent>(_changedLoginRegistrationPage);
    on<LoginEmailChanged>(_onEmailChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.password]),
    ));
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email]),
    ));
  }

  void _onSubmittedLogin(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.logIn(
          username: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _onSubmittedRegistration(
    RegisterSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.register(
          username: state.username!.value,
          password: state.password.value,
          email: state.email.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _changedLoginRegistrationPage(
    ChangedPageEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (state.registration == true) {
      emit(state.copyWith(registration: false));
    } else {
      emit(state.copyWith(registration: true));
    }
  }
}

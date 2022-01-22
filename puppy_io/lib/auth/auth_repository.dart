import 'dart:async';

import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:puppy_io/auth/auth_api_provider.dart';
import 'package:puppy_io/data/models/login_model.dart';
import 'package:puppy_io/data/models/register_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final SharedPreferencesHelper _preferencesHelper;
  final _controller = StreamController<AuthenticationStatus>();
  final AuthApiProvider _apiProvider;

  AuthenticationRepository(this._apiProvider, this._preferencesHelper);

  Stream<AuthenticationStatus> get status async* {
    bool isUserLogin = await _preferencesHelper.getBoolPreference(SharedPreferencesHelper.isUserLogIn) ?? false;
    await Future<void>.delayed(const Duration(seconds: 1));
    if (isUserLogin) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String userName,
    required String password,
  }) async {

    final user = await _apiProvider.login(Login(password: password, userName: userName));
    await _preferencesHelper.setBoolPreference(SharedPreferencesHelper.isUserLogIn, true);
    await _preferencesHelper.getBoolPreference(SharedPreferencesHelper.isUserLogIn);
    await _preferencesHelper.setStringPreference(SharedPreferencesHelper.email, userName);
    await _preferencesHelper.setStringPreference(SharedPreferencesHelper.userPassword, password);

    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthenticationStatus.authenticated);
      },
    );
  }

  Future<void> register({
    required String username,
    required String password,
    required String email,
  }) async {
    _apiProvider.register(Register(password: password, email: email, userName: username));
    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthenticationStatus.authenticated);
      },
    );
  }

  Future<void> logOut() async {
    await _preferencesHelper.setBoolPreference(SharedPreferencesHelper.isUserLogIn, false);
    await _preferencesHelper.setStringPreference(SharedPreferencesHelper.email, '');
    await _preferencesHelper.setStringPreference(SharedPreferencesHelper.userPassword, '');
    await _preferencesHelper.setStringPreference(SharedPreferencesHelper.userName, '');

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

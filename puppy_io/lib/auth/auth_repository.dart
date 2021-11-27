import 'dart:async';

import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final SharedPreferencesHelper _preferencesHelper;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository(this._preferencesHelper);

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
    required String username,
    required String password,
  }) async {
    await _preferencesHelper.setBoolPreference(SharedPreferencesHelper.isUserLogIn, true);
    await _preferencesHelper.getBoolPreference(SharedPreferencesHelper.isUserLogIn);
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
    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthenticationStatus.authenticated);
      },
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

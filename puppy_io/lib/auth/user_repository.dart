import 'dart:async';

import 'package:puppy_io/data/models/user.dart';
import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;

  UserRepository(this._preferencesHelper);

  final SharedPreferencesHelper _preferencesHelper;

  Future<User?> getUser() async {
    final email = await _preferencesHelper.getStringPreference(SharedPreferencesHelper.email);
    final password = await _preferencesHelper.getStringPreference(SharedPreferencesHelper.userPassword);
    final userName = await _preferencesHelper.getStringPreference(SharedPreferencesHelper.userName);

    final User user = User(
      userName: userName ?? '',
      id: const Uuid().v4(),
      password: password ?? '',
      email: email ?? '',
    );
    if (_user != null) {
      return _user;
    }

    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = user,
    );
  }
}

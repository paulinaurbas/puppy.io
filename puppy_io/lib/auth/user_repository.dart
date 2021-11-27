import 'dart:async';

import 'package:puppy_io/data/models/user.dart';
import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;
  final SharedPreferencesHelper _preferencesHelper;

  UserRepository(this._preferencesHelper);

  Future<User?> getUser() async {
    if (_user != null) {
      return _user;
    }
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}

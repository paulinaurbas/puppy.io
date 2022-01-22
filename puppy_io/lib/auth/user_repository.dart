import 'dart:async';

import 'package:puppy_io/data/models/user.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;

  UserRepository();

  Future<User?> getUser() async {
    final User user = User(const Uuid().v4(), 'Paulina', 'paulina.urbas@gmail.com', 'lalalaa');
    if (_user != null) {
      return _user;
    }

    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = user,
    );
  }
}

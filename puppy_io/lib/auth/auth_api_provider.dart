import 'package:dio/dio.dart';
import 'package:puppy_io/data/models/login_model.dart';
import 'package:puppy_io/data/models/register_model.dart';
import 'package:puppy_io/data/models/user.dart';

class AuthApiProvider {
  final Dio _dio = Dio();

  Future<User> login(Login loginModel) async {
    return _dio.post('https://puppy-io.herokuapp.com/logIn', data: loginModel.toJson()).then((value) {
      return User.fromJson(value.data);
    });
  }

  Future<User> register(Register registerModel) async {
   return _dio.post('https://puppy-io.herokuapp.com/signIn', data: registerModel.toJson()).then((value) {
     return User.fromJson(value.data);
    });
  }

}

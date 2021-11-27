import 'package:dio/dio.dart';
import 'package:puppy_io/data/models/login_model.dart';
import 'package:puppy_io/data/models/register_model.dart';

class AuthApiProvider {
  final Dio _dio = Dio();

  Future<bool> login(Login loginModel) async {
    //TODO: add call to backend
    return true;
  }

  Future<bool> register(Register registerModel) async {
    //TODO: add call to backend
    return true;
  }

}

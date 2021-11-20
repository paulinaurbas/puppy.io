import 'package:dio/dio.dart';
import 'package:puppy_io/data/models/login_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<bool> login(Login loginModel) async {
    //TODO: add call to backend
    return true;
  }

  Future<bool> register(Login loginModel) async {
    //TODO: add call to backend
    return true;
  }
}

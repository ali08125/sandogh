import 'package:dio/dio.dart';
import 'package:sandogh/data/auth_info.dart';

abstract class IAuthDataSource {
  Future<AuthInfo> login(String username, String password);
}

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio httpClient;

  AuthRemoteDataSource(this.httpClient);
  @override
  Future<AuthInfo> login(String username, String password) async {
    final response = await httpClient.post('token/',
        data: {'phone_number': username, 'password': password});

    return AuthInfo.fromJson(response.data);
  }
}

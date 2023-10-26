import 'package:flutter/material.dart';
import 'package:sandogh/data/auth_info.dart';
import 'package:sandogh/data/common/http_client.dart';
import 'package:sandogh/data/source/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final AuthRepository authRepository =
    AuthRepository(AuthRemoteDataSource(httpClient));

abstract class IAuthRepository {
  Future<void> login(String username, String password);
  Future<void> loginAtStart();
}

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;
  static final ValueNotifier<AuthInfo?> authChangeNotifir = ValueNotifier(null);

  AuthRepository(this.dataSource);
  @override
  Future<void> login(String username, String password) async {
    final AuthInfo authInfo = await dataSource.login(username, password);
    _saveToken(authInfo);
  }

  Future<void> _saveToken(AuthInfo authInfo) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.accessToken);
    _loadToken();
  }

  Future<void> _loadToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';
    if (accessToken.isNotEmpty) {
      authChangeNotifir.value = AuthInfo(accessToken);
    }
  }

  @override
  Future<void> loginAtStart() async{
    await _loadToken();
  }
}

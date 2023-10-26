import 'package:dio/dio.dart';
import 'package:sandogh/data/user.dart';

abstract class IUsersDataSource {
  Future<List<UserEntity>> getUsers();
}

class UsersRemoteDataSource implements IUsersDataSource {
  final Dio httpClient;

  UsersRemoteDataSource(this.httpClient);
  @override
  Future<List<UserEntity>> getUsers() async {
    final response = await httpClient.get('user/all/');
    final List<UserEntity> users = [];

    for (var element in (response.data as List)) {
      users.add(UserEntity.fromJson(element));
    }
    return users;
  }
}

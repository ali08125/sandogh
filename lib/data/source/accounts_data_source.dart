import 'package:dio/dio.dart';
import 'package:sandogh/data/account.dart';

abstract class IAccountDataSource {
  Future<List<AccountEntity>> getAll();
}

class AccountRemoteDataSource implements IAccountDataSource {
  final Dio httpClient;

  AccountRemoteDataSource(this.httpClient);

  @override
  Future<List<AccountEntity>> getAll() async {
    final response = await httpClient.get('account/all/');

    final List<AccountEntity> accounts = [];
    for (var element in response.data) {
      accounts.add(AccountEntity.fromJson(element));
    }
    return accounts;
  }
}

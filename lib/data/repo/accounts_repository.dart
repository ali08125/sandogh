import 'package:sandogh/data/account.dart';
import 'package:sandogh/data/common/http_client.dart';
import 'package:sandogh/data/source/accounts_data_source.dart';

final accountRepository =
    AccountRepository(AccountRemoteDataSource(httpClient));

abstract class IAccountRepository extends IAccountDataSource {}

class AccountRepository implements IAccountRepository {
  final IAccountDataSource dataSource;

  AccountRepository(this.dataSource);
  @override
  Future<List<AccountEntity>> getAll() => dataSource.getAll();
}

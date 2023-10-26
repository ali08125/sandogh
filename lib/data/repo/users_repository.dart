import 'package:sandogh/data/common/http_client.dart';
import 'package:sandogh/data/source/users_data_source.dart';
import 'package:sandogh/data/user.dart';

final usersRepository = UsersRepository(UsersRemoteDataSource(httpClient));

abstract class IUsersRepository extends IUsersDataSource {}

class UsersRepository implements IUsersRepository {
  final IUsersDataSource dataSource;

  UsersRepository(this.dataSource);

  @override
  Future<List<UserEntity>> getUsers() => dataSource.getUsers();
}

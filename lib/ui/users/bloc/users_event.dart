part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class UsersStarted extends UsersEvent {}

class UserSearchClicked extends UsersEvent {
  final String search;
  final List<UserEntity> users;

  UserSearchClicked(this.search, this.users);
}

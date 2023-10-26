part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UserEntity> users;

  UsersSuccess(this.users);
}

class UsersError extends UsersState {}



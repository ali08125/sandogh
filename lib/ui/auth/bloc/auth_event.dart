part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthButtonClicked extends AuthEvent {
  final String username;
  final String password;

  AuthButtonClicked(this.username, this.password);
}

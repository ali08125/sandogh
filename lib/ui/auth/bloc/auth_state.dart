part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {}
class AuthLoading extends AuthState {}
class AuthError extends AuthState {}


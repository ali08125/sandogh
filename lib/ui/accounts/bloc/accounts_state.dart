part of 'accounts_bloc.dart';

@immutable
abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

class AccountsLoading extends AccountsState {}

class AccountsSuccess extends AccountsState {
  final List<AccountEntity> accounts;

  AccountsSuccess(this.accounts);
}

class AccountsError extends AccountsState {}

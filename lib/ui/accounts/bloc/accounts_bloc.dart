import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandogh/data/account.dart';
import 'package:sandogh/data/repo/accounts_repository.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final IAccountRepository accountRepository;
  AccountsBloc(this.accountRepository) : super(AccountsInitial()) {
    on<AccountsEvent>((event, emit) async {
      if (event is AccountStarted) {
        try {
          emit(AccountsLoading());
          final accounts = await accountRepository.getAll();
          emit(AccountsSuccess(accounts));
        } catch (e) {
          emit(AccountsError());
        }
      }
    });
  }
}

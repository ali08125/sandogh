import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandogh/constants/screens.dart';
import 'package:sandogh/data/repo/accounts_repository.dart';
import 'package:sandogh/ui/accounts/bloc/accounts_bloc.dart';
import 'package:sandogh/ui/widgets/page.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AccountsBloc(accountRepository);
        bloc.add(AccountStarted());
        return bloc;
      },
      child: Scaffold(body: BlocBuilder<AccountsBloc, AccountsState>(
        builder: (context, state) {
          if (state is AccountsSuccess) {
            return CustomPage(
                info: state.accounts,
                title: 'حساب ها',
                headers: const ['شماره حساب', 'نام', 'صاحب حساب', 'کیف پول'],
                screen: Screens.accountScreen, search: (String value) {  },);
          } else if (state is AccountsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AccountsError) {
            return Center(
              child: Text(
                'خطا',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 32),
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sandogh/constants/screens.dart';
import 'package:sandogh/data/repo/users_repository.dart';
import 'package:sandogh/ui/users/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandogh/ui/widgets/page.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = UsersBloc(usersRepository);

        bloc.add(UsersStarted());
        return bloc;
      },
      child: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        if (state is UsersSuccess) {
          return CustomPage(
            info: state.users,
            title: 'لیست کاربران',
            headers: const ['تلفن همراه', 'نام', 'نام پدر', 'کیف پول'],
            screen: Screens.userScreen,
            search: (String value) {
              BlocProvider.of<UsersBloc>(context)
                  .add(UserSearchClicked(value, state.users));
            },
          );
        } else if (state is UsersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UsersError) {
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
      }),
    );
  }
}

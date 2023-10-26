import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandogh/constants/screens.dart';
import 'package:sandogh/data/repo/loan_repository.dart';
import 'package:sandogh/ui/loan/bloc/loan_bloc.dart';
import 'package:sandogh/ui/widgets/page.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = LoanBloc(loanRepository);
        bloc.add(LoanStarted());
        return bloc;
      },
      child: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          if (state is LoanSuccess) {
            return CustomPage(
                info: state.loans,
                title: 'اقساط',
                headers: const ['شماره حساب', 'تاریخ پرداخت', 'بدهی'],
                screen: Screens.loanScreen,
                search: (String t) {});
          } else if (state is LoanLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoanError) {
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
      ),
    );
  }
}

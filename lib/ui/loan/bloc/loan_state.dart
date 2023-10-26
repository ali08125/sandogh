part of 'loan_bloc.dart';

@immutable
abstract class LoanState {}

class LoanInitial extends LoanState {}

class LoanLoading extends LoanState {}

class LoanSuccess extends LoanState {
  final List<LoanEntity> loans;

  LoanSuccess(this.loans);
}

class LoanError extends LoanState {}

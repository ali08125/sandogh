import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sandogh/data/loan.dart';
import 'package:sandogh/data/repo/loan_repository.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final ILoanRepository loanRepository;
  LoanBloc(this.loanRepository) : super(LoanInitial()) {
    on<LoanEvent>((event, emit) async{
      if (event is LoanStarted) {
        try {
          emit(LoanLoading());
          //final loans = await loanRepository.getAll();
          final List<LoanEntity> loans = [
            LoanEntity(1, 2, '123', 4),
            LoanEntity(1, 2, '123', 4),
            LoanEntity(1, 2, '123', 4),
            LoanEntity(1, 2, '123', 4),
          ];
          emit(LoanSuccess(loans));
        } catch (e) {
          emit(LoanError());
        }
      }
    });
  }
}

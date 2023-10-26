import 'package:sandogh/data/common/http_client.dart';
import 'package:sandogh/data/loan.dart';
import 'package:sandogh/data/source/loan_data_source.dart';

final loanRepository = LoanRepository(LoanRemoteDataSource(httpClient));

abstract class ILoanRepository extends ILoanDataSource {}

class LoanRepository implements ILoanRepository {
  final ILoanDataSource dataSource;

  LoanRepository(this.dataSource);
  @override
  Future<List<LoanEntity>> getAll() => dataSource.getAll();
}

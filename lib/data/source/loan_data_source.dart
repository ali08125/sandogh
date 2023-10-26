import 'package:dio/dio.dart';
import 'package:sandogh/data/loan.dart';

abstract class ILoanDataSource {
  Future<List<LoanEntity>> getAll();
}

class LoanRemoteDataSource implements ILoanDataSource {
  final Dio httpClient;

  LoanRemoteDataSource(this.httpClient);

  @override
  Future<List<LoanEntity>> getAll() async {
    final response = await httpClient.get('loan/all/');

    final List<LoanEntity> loans = [];

    for (var element in response.data) {
      loans.add(LoanEntity.fromJson(element));
    }

    return loans;
  }
}

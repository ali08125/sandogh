class LoanEntity {
  final int id;
  final int accountNumber;
  final String regTime;
  final int debt;

  LoanEntity(this.id, this.accountNumber, this.regTime, this.debt);

  LoanEntity.fromJson(dynamic json)
      : id = json['id'],
        accountNumber = json['account'],
        regTime = json['reg_time'],
        debt = json['debt'];
}

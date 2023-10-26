class AccountEntity {
  final int id;
  final int accountNumber;
  final String name;
  final int owner;
  final int amount;

  AccountEntity(
      this.id, this.accountNumber, this.name, this.owner, this.amount);

  AccountEntity.fromJson(dynamic json)
      : id = json['id'],
        accountNumber = json['account_number'],
        name = json['name'],
        owner = json['owner'],
        amount = json['amount'];
}

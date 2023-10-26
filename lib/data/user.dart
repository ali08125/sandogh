class UserEntity {
  final int id;
  final String phoneNumber;
  final String name;
  final String fatherName;
  final int amount;

  UserEntity(
      this.id, this.phoneNumber, this.name, this.fatherName, this.amount);

  UserEntity.fromJson(dynamic json)
      : id = json['id'],
        phoneNumber = json['phone_number'],
        name = json['name'],
        fatherName = json['father_name'],
        amount = json['amount'];
}

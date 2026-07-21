class UserEntity {
  String fullName;
  String email;
  String id;
  String address;
  String phoneNumber;
  String profileImage;
  String status;
  UserBankAccount? userBankAccount; //
  String? latitude;
  String? longitude;
  String? playerId;

  UserEntity({
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.id,
    this.latitude,
    this.longitude,
    this.playerId,
    required this.profileImage,
    required this.status,
    this.userBankAccount,
  });
}

class UserBankAccount {
  String? accountHolderName;
  String? accountNumber;
  String? bankName;
  String? id;

  UserBankAccount({
    this.accountHolderName,
    this.accountNumber,
    this.bankName,
    this.id,
  });
}

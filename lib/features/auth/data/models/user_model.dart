import 'package:rider_clean/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.status,
    required super.address,
    required super.phoneNumber,
    required super.fullName,
    required super.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      status: json['status'],
      profileImage: json['profile_image'],
      address: json["address"] ?? '',
    );
  }


}

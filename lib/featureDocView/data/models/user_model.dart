import 'dart:convert';

class UserModel {
  final String fullName;
  final String email;
  final String membershipDate;

  UserModel({
    required this.fullName,
    required this.email,
    required this.membershipDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['enFullName'],
      email: json['email'],
      membershipDate: json['membershipDate'],
    );
  }
}

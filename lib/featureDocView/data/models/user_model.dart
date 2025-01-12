class UserModel {
  final String fullName;
  final String email;
  final String membershipDate;
  final String pfp;
  UserModel({
    required this.fullName,
    required this.email,
    required this.membershipDate,
    required this.pfp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['enFullName'],
      email: json['email'],
      membershipDate: json['membershipDate'],
      pfp: json['personalImage']?['path'],
    );
  }
}

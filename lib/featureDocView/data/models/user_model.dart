class UserModel {
  final String fullName;
  final String email;
  final String membershipDate;
  final String pfp;
  final String arFullname;
  final String profisinaloti;
  final String id;
  final String status;

  UserModel({
    required this.fullName,
    required this.email,
    required this.membershipDate,
    required this.pfp,
    required this.arFullname,
    required this.profisinaloti,
    required this.id,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['enFullName'] ?? '',
      email: json['email'] ?? '',
      membershipDate: json['membershipDate'] ?? '',
      pfp: json['personalImage']?['path'] ?? '',
      arFullname: json['arFullName'] ?? '',
      profisinaloti: json['doctorProfessionalities'][0]['professionality']
          ?['arName'],
      id: json['registrationNo'] ?? '',
      status: json['doctorProfessionalities'][0]['status']?['arName'],
    );
  }
}

class UserModel {
  final String ID;
  final String fullName;
  final String email;
  final String membershipDate;
  final String pfp;
  final String arFullname;
  final String profisinaloti;
  final String id;
  final String status;
  final String membershipAcceptDate;

  UserModel({
    required this.ID,
    required this.fullName,
    required this.email,
    required this.membershipDate,
    required this.pfp,
    required this.arFullname,
    required this.profisinaloti,
    required this.id,
    required this.status,
    required this.membershipAcceptDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      ID: json['id'] ?? '',
      fullName: json['enFullName'] ?? '',
      email: json['email'] ?? '',
      membershipDate: json['membershipDate'] ?? '',
      pfp: json['personalImage']?['path'] ?? '',
      arFullname: json['arFullName'] ?? '',
      profisinaloti: json['doctorProfessionalities'][0]['professionality']
          ?['arName'],
      id: json['registrationNo'] ?? '',
      status: json['doctorProfessionalities'][0]['status']?['arName'],
      membershipAcceptDate: json['membershipAcceptDate'] ?? '',
    );
  }
}

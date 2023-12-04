import '../../../companies/data/response/companies_response.dart';

class EnrollmentsResponse {
  EnrollmentsResponse({
    required this.result,
  });

  final List<Enrollment> result;

  factory EnrollmentsResponse.fromJson(Map<String, dynamic> json) {
    return EnrollmentsResponse(
      result: json["result"] == null
          ? []
          : List<Enrollment>.from(json["result"]!.map((x) => Enrollment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class Enrollment {
  Enrollment({
    required this.id,
    required this.companyId,
    required this.company,
    required this.planId,
    required this.plan,
    required this.userId,
    required this.user,
    required this.startDate,
    required this.expiryDate,
  });

  final int id;
  final int companyId;
  final CompanyModel company;
  final num planId;
  final String plan;
  final num userId;
  final User user;
  final DateTime? startDate;
  final DateTime? expiryDate;

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      id: json["id"] ?? 0,
      companyId: json["companyId"] ?? 0,
      company: CompanyModel.fromJson(json["company"] ?? {}),
      planId: json["planId"] ?? 0,
      plan: json["plan"] ?? "",
      userId: json["userId"] ?? 0,
      user: User.fromJson(json["user"] ?? {}),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyId": companyId,
    "company": company.toJson(),
    "planId": planId,
    "plan": plan,
    "userId": userId,
    "user": user.toJson(),
    "startDate": startDate?.toIso8601String(),
    "expiryDate": expiryDate?.toIso8601String(),
  };
}

class User {
  User({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.avatar,
    required this.emergencyPhone,
    required this.userType,
    required this.accountBalance,
  });

  final int id;
  final String userName;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String avatar;
  final String emergencyPhone;
  final String userType;
  final num accountBalance;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      userName: json["userName"] ?? "",
      fullName: json["fullName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      avatar: json["avatar"] ?? "",
      emergencyPhone: json["emergencyPhone"] ?? "",
      userType: json["userType"] ?? "",
      accountBalance: json["accountBalance"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "fullName": fullName,
    "name": name,
    "surname": surname,
    "phoneNumber": phoneNumber,
    "avatar": avatar,
    "emergencyPhone": emergencyPhone,
    "userType": userType,
    "accountBalance": accountBalance,
  };
}

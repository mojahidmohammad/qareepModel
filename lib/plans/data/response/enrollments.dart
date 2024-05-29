import 'package:qareeb_models/plans/data/response/plans_response.dart';

import '../../../companies/data/response/companies_response.dart';

class EnrollmentsResponse1 {
  EnrollmentsResponse1({
    required this.items,
    required this.totalCount,
  });

  final List<Enrollment> items;
  final int totalCount;

  factory EnrollmentsResponse1.fromJson(Map<String, dynamic> json) {
    return EnrollmentsResponse1(
      items: json["items"] == null
          ? []
          : List<Enrollment>.from(
              json["items"]!.map((x) => Enrollment.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class EnrollmentsResponse {
  EnrollmentsResponse({
    required this.result,
  });

  final List<Enrollment> result;

  factory EnrollmentsResponse.fromJson(Map<String, dynamic> json) {
    return EnrollmentsResponse(
      result: json["result"] == null
          ? []
          : List<Enrollment>.from(
              json["result"]!.map((x) => Enrollment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class Enrollment {
  Enrollment({
    required this.companyId,
    required this.company,
    required this.planId,
    required this.plan,
    required this.userId,
    required this.user,
    required this.startDate,
    required this.expiryDate,
    required this.countOfRecordToday,
    required this.countOfRecordThisMounth,
    required this.isExpired,
    required this.isTodayConsumed,
    required this.isPlanConsumed,
    required this.id,
    required this.consumedMeters,
    required this.availableMeters,
    required this.availableMinutes,
    required this.consumedMinutes,
    required this.cancellationDate,
    required this.isCanceled,
  });

  final int companyId;
  final CompanyModel company;
  final int planId;
  final PlanModel plan;
  final int userId;
  final User user;
  final DateTime? startDate;
  final DateTime? expiryDate;
  final num countOfRecordToday;
  final num countOfRecordThisMounth;
  final bool isExpired;
  final bool isTodayConsumed;
  final bool isPlanConsumed;
  final int id;
  final num consumedMeters;
  final num availableMinutes;
  final num consumedMinutes;
  final num availableMeters;
  final DateTime? cancellationDate;
  final bool isCanceled;

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      companyId: json["companyId"] ?? 0,
      company: CompanyModel.fromJson(json["company"] ?? {}),
      planId: json["planId"] ?? 0,
      plan: PlanModel.fromJson(json["plan"] ?? {}),
      userId: json["userId"] ?? 0,
      user: User.fromJson(json["user"] ?? {}),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
      countOfRecordToday: json["countOfRecordToday"] ?? 0,
      countOfRecordThisMounth: json["countOfRecordThisMounth"] ?? 0,
      isExpired: json["isExpired"] ?? false,
      isTodayConsumed: json["isTodayConsumed"] ?? false,
      isPlanConsumed: json["isPlanConsumed"] ?? false,
      id: json["id"] ?? 0,
      consumedMeters: json["consumedMeters"] ?? 0,
      availableMeters: json["availableMeters"] ?? 0,
      availableMinutes: json["availableMinutes"] ?? 0,
      consumedMinutes: json["consumedMinutes"] ?? 0,
      cancellationDate: DateTime.tryParse(json["cancellationDate"] ?? ""),
      isCanceled: json["isCanceled"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "company": company.toJson(),
        "planId": planId,
        "plan": plan.toJson(),
        "userId": userId,
        "user": user.toJson(),
        "startDate": startDate?.toIso8601String(),
        "expiryDate": expiryDate?.toIso8601String(),
        "countOfRecordToday": countOfRecordToday,
        "countOfRecordThisMounth": countOfRecordThisMounth,
        "isExpired": isExpired,
        "isTodayConsumed": isTodayConsumed,
        "isPlanConsumed": isPlanConsumed,
        "id": id,
        "consumedMeters": consumedMeters,
        "availableMeters": availableMeters,
        "availableMinutes": availableMinutes,
        "consumedMinutes": consumedMinutes,
        "cancellationDate": cancellationDate?.toIso8601String(),
        "isCanceled": isCanceled,
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

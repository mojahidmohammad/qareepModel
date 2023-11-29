class SosResponse {
  SosResponse({
    required this.result,
  });

  final SosResult? result;

  factory SosResponse.fromJson(Map<String, dynamic> json) {
    return SosResponse(
      result: json["result"] == null ? null : SosResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class SosResult {
  SosResult({
    required this.items,
    required this.totalCount,
  });

  final List<Sos> items;
  final int totalCount;

  factory SosResult.fromJson(Map<String, dynamic> json) {
    return SosResult(
      items: json["items"] == null
          ? []
          : List<Sos>.from(json["items"]!.map((x) => Sos.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class Sos {
  Sos({
    required this.id,
    required this.memberId,
    required this.user,
    required this.member,
    required this.date,
  });

  final int id;
  final num memberId;
  final User user;
  final Member member;
  final DateTime? date;

  String get getName {
    return user.name.isEmpty ? member.fullName : user.name;
  }

  String get getPhone {
    return user.phoneNumber.isEmpty ? member.phoneNo : user.phoneNumber;
  }

  factory Sos.fromJson(Map<String, dynamic> json) {
    return Sos(
      id: json["id"] ?? 0,
      memberId: json["memberId"] ?? 0,
      user: User.fromJson(json["user"] ?? {}),
      member: Member.fromJson(json["member"] ?? {}),
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "memberId": memberId,
        "user": user.toJson(),
        "member": member.toJson(),
        "date": date?.toIso8601String(),
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

class Member {
  Member({
    required this.id,
    required this.fullName,
    required this.imageUrl,
    required this.address,
    required this.late,
    required this.longe,
    required this.userName,
    required this.password,
    required this.phoneNo,
    required this.facility,
    required this.idNumber,
    required this.collegeIdNumber,
    required this.session,
    required this.institutionId,
    required this.emergencyPhone,
  });

  final int id;
  final String fullName;
  final String imageUrl;
  final String address;
  final num late;
  final num longe;
  final String userName;
  final String password;
  final String phoneNo;
  final String facility;
  final String idNumber;
  final String collegeIdNumber;
  final String session;
  final num institutionId;
  final String emergencyPhone;

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json["id"] ?? 0,
      fullName: json["fullName"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      address: json["address"] ?? "",
      late: json["late"] ?? 0,
      longe: json["longe"] ?? 0,
      userName: json["userName"] ?? "",
      password: json["password"] ?? "",
      phoneNo: json["phoneNo"] ?? "",
      facility: json["facility"] ?? "",
      idNumber: json["idNumber"] ?? "",
      collegeIdNumber: json["collegeIdNumber"] ?? "",
      session: json["session"] ?? "",
      institutionId: json["institutionId"] ?? 0,
      emergencyPhone: json["emergencyPhone"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "imageUrl": imageUrl,
        "address": address,
        "late": late,
        "longe": longe,
        "userName": userName,
        "password": password,
        "phoneNo": phoneNo,
        "facility": facility,
        "idNumber": idNumber,
        "collegeIdNumber": collegeIdNumber,
        "session": session,
        "institutionId": institutionId,
        "emergencyPhone": emergencyPhone,
      };
}

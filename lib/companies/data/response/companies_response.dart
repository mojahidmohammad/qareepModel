import '../../../global.dart';

class CompanyResponse {
  CompanyResponse({
    required this.result,
  });

  final CompanyModel result;

  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    return CompanyResponse(
      result: CompanyModel.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class CompaniesResponse {
  CompaniesResponse({
    required this.result,
  });

  final CompaniesResult result;

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) {
    return CompaniesResponse(
      result: CompaniesResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class CompaniesResult {
  CompaniesResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<CompanyModel> items;

  factory CompaniesResult.fromJson(Map<String, dynamic> json) {
    return CompaniesResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<CompanyModel>.from(json["items"]!.map((x) => CompanyModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class CompanyModel {
  CompanyModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.isActive,
    required this.manager,
    required this.employees,
  });

  final int id;
  final String name;
  final String imageUrl;
  final CompanyType type;
  final bool isActive;
  final Manager manager;
  final List<Employee> employees;

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      imageUrl: FixUrl.fixAvatarImage(json["imageUrl"] ?? ""),
      type: CompanyType.values[json["type"] ?? 0],
      isActive: json["isActive"] ?? false,
      manager: Manager.fromJson(json["manager"] ?? {}),
      employees: json["employees"] == null
          ? []
          : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "type": type.index,
        "isActive": isActive,
        "manager": manager.toJson(),
        "employees": employees.map((x) => x.toJson()).toList(),
      };
}

class Employee {
  Employee({
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

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
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

class Manager {
  Manager({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.avatar,
  });

  final int id;
  final String fullName;
  final String phoneNumber;
  final String avatar;

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      id: json["id"] ?? 0,
      fullName: json["fullName"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
      };
}

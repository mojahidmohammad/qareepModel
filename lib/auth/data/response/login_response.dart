import '../../../global.dart';

class LoginResponse {
  LoginResponse({
    required this.result,
  });

  final LoginResult result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      result: LoginResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class LoginResult {
  LoginResult({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
    required this.accepctPolicy,
    required this.institutionId,
    required this.agencyId,
    required this.userType,
    required this.roleName,
    required this.identifier,
    required this.isActive,
  });

  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final int userId;

  final bool accepctPolicy;
  final int institutionId;
  final int agencyId;
  final UserType userType;
  final String roleName;
  final String identifier;
  final bool isActive;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      accessToken: json["accessToken"] ?? "",
      encryptedAccessToken: json["encryptedAccessToken"] ?? "",
      expireInSeconds: json["expireInSeconds"] ?? 0,
      userId: json["userId"] ?? 0,
      accepctPolicy: json["accepctPolicy"] ?? false,
      institutionId: json["institutionId"] ?? 0,
      agencyId: json["agencyId"] ?? 0,
      userType: UserType.values[json["userType"] ?? 0],
      roleName: json["roleName"] ?? "",
      identifier: json["identifier"] ?? "",
      isActive: json["isActive"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "encryptedAccessToken": encryptedAccessToken,
        "expireInSeconds": expireInSeconds,
        "userId": userId,
        "accepctPolicy": accepctPolicy,
        "institutionId": institutionId,
        "agencyId": agencyId,
        "userType": userType.index,
        "roleName": roleName,
        "identifier": identifier,
    "isActive": isActive,
      };
}

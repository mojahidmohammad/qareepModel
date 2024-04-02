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
    required this.userTrip,
    required this.accepctPolicy,
    required this.institutionId,
    required this.agencyId,
    required this.userType,
    required this.roleName,
    required this.identifier,
  });

  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final int userId;
  final String userTrip;
  final bool accepctPolicy;
  final int institutionId;
  final int agencyId;
  final String userType;
  final String roleName;
  final String identifier;

  factory LoginResult.fromJson(Map<String, dynamic> json){
    return LoginResult(
      accessToken: json["accessToken"] ?? "",
      encryptedAccessToken: json["encryptedAccessToken"] ?? "",
      expireInSeconds: json["expireInSeconds"] ?? 0,
      userId: json["userId"] ?? 0,
      userTrip: json["userTrip"] ?? "",
      accepctPolicy: json["accepctPolicy"] ?? false,
      institutionId: json["institutionId"] ?? 0,
      agencyId: json["agencyId"] ?? 0,
      userType: json["userType"] ?? "",
      roleName: json["roleName"] ?? "",
      identifier: json["identifier"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "encryptedAccessToken": encryptedAccessToken,
    "expireInSeconds": expireInSeconds,
    "userId": userId,
    "userTrip": userTrip,
    "accepctPolicy": accepctPolicy,
    "institutionId": institutionId,
    "agencyId": agencyId,
    "userType": userType,
    "roleName": roleName,
    "identifier": identifier,
  };

}

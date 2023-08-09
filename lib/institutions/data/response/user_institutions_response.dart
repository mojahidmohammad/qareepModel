
import 'institutions_response.dart';
import 'member_response.dart';

class UserInstitutionsResponse {
  UserInstitutionsResponse({
    required this.result,
  });

  final List<UserInstitution> result;

  factory UserInstitutionsResponse.fromJson(Map<String, dynamic> json) {
    return UserInstitutionsResponse(
      result: json["result"] == null
          ? []
          : List<UserInstitution>.from(
              json["result"]!.map((x) => UserInstitution.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class UserInstitution {
  UserInstitution({
    required this.id,
    required this.institutionId,
    required this.institution,
    required this.memberId,
    required this.member,
    required this.supscriptionDate,
    required this.expirationDate,
    required this.isActive,
  });

  final int id;
  final num institutionId;
  final InstitutionModel institution;
  final num memberId;
  final Member member;
  final DateTime? supscriptionDate;
  final DateTime? expirationDate;
  final bool isActive;


  factory UserInstitution.fromJson(Map<String, dynamic> json) {
    return UserInstitution(
      id: json["id"] ?? 0,
      institutionId: json["institutionId"] ?? 0,
      institution: InstitutionModel.fromJson(json["institution"] ?? {}),
      memberId: json["memberId"] ?? 0,
      member: Member.fromJson(json["member"] ?? {}),
      supscriptionDate: DateTime.tryParse(json["supscriptionDate"] ?? ""),
      expirationDate: DateTime.tryParse(json["expirationDate"] ?? ""),
      isActive: json["isActive"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "institutionId": institutionId,
        "institution": institution.toJson(),
        "memberId": memberId,
        "member": member.toJson(),
        "supscriptionDate": supscriptionDate?.toIso8601String(),
        "expirationDate": expirationDate?.toIso8601String(),
        "isActive": isActive,
      };
}

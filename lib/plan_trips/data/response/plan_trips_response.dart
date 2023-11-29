import '../../../companies/data/response/companies_response.dart';
import '../../../company_paths/data/response/company_paths_response.dart';
import '../../../global.dart';
import '../../../trip_path/data/models/trip_path.dart';
import '../../../trip_process/data/response/trip_response.dart';

class PlanTripsResponse {
  PlanTripsResponse({
    required this.result,
  });

  final PlanTripsResult? result;

  factory PlanTripsResponse.fromJson(Map<String, dynamic> json) {
    return PlanTripsResponse(
      result: json["result"] == null ? null : PlanTripsResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class PlanTripsResult {
  PlanTripsResult({
    required this.items,
    required this.totalCount,
  });

  final List<PlanTripModel> items;
  final int totalCount;

  factory PlanTripsResult.fromJson(Map<String, dynamic> json) {
    return PlanTripsResult(
      items: json["items"] == null
          ? []
          : List<PlanTripModel>.from(
              json["items"]!.map((x) => PlanTripModel.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class PlanTripModel {
  PlanTripModel({
    required this.id,
    required this.name,
    required this.companyPathId,
    required this.companyPath,
    required this.companyId,
    required this.description,
    required this.company,
    required this.drivers,
    required this.startDate,
    required this.endDate,
    required this.days,
  });

  final int id;
  final String name;
  final int companyPathId;
  final CompanyPath companyPath;
  final int companyId;
  final String description;
  final CompanyModel company;
  final List<Driver> drivers;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<WeekDays> days;

  factory PlanTripModel.fromJson(Map<String, dynamic> json) {
    return PlanTripModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      companyPathId: json["companyPathId"] ?? 0,
      companyPath: CompanyPath.fromJson(json["companyPath"] ?? {}),
      companyId: json["companyId"] ?? 0,
      description: json["description"] ?? "",
      company: CompanyModel.fromJson(json["company"] ?? {}),
      drivers: json["drivers"] == null
          ? []
          : List<Driver>.from(json["drivers"]!.map((x) => Driver.fromJson(x))),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      days: json["days"] == null
          ? <WeekDays>[]
          : List<WeekDays>.from(json["days"]!.map((x) => WeekDays.values[x])),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "companyPathId": companyPathId,
        "companyPath": companyPath.toJson(),
        "companyId": companyId,
        "description": description,
        "company": company.toJson(),
        "drivers": drivers.map((x) => x.toJson()).toList(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "days": days.map((x) => x).toList(),
      };
}

import '../../../companies/data/response/companies_response.dart';
import '../../../company_paths/data/response/company_paths_response.dart';
import '../../../global.dart';
import '../../../trip_process/data/response/trip_response.dart';

class PlanTripsResponse {
  PlanTripsResponse({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  final PlanTrip result;
  final dynamic targetUrl;
  final bool success;
  final dynamic error;
  final bool unAuthorizedRequest;
  final bool abp;

  factory PlanTripsResponse.fromJson(Map<String, dynamic> json) {
    return PlanTripsResponse(
      result: PlanTrip.fromJson(json["result"] ?? {}),
      targetUrl: json["targetUrl"],
      success: json["success"] ?? false,
      error: json["error"],
      unAuthorizedRequest: json["unAuthorizedRequest"] ?? false,
      abp: json["__abp"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class PlanTrip {
  PlanTrip({
    required this.id,
    required this.name,
    required this.companyPathId,
    required this.companyPath,
    required this.companyId,
    required this.company,
    required this.description,
    required this.driverTrips,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.isActive,
  });

  final int id;
  final String name;
  final num companyPathId;
  final CompanyPath companyPath;
  final num companyId;
  final CompanyModel company;
  final String description;
  final List<PlanDriverTrip> driverTrips;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> days;
  final bool isActive;

  factory PlanTrip.fromJson(Map<String, dynamic> json) {
    return PlanTrip(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      companyPathId: json["companyPathId"] ?? 0,
      companyPath: CompanyPath.fromJson(json["companyPath"] ?? {}),
      companyId: json["companyId"] ?? 0,
      company: CompanyModel.fromJson(json["company"] ?? {}),
      description: json["description"] ?? "",
      driverTrips: json["driverTrips"] == null
          ? []
          : List<PlanDriverTrip>.from(
              json["driverTrips"]!.map((x) => PlanDriverTrip.fromJson(x))),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      days: json["days"] == null
          ? []
          : List<String>.from(json["days"]!.map((x) => x)),
      isActive: json["isActive"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "companyPathId": companyPathId,
        "companyPath": companyPath.toJson(),
        "companyId": companyId,
        "company": company.toJson(),
        "description": description,
        "driverTrips": driverTrips.map((x) => x.toJson()).toList(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "days": days.map((x) => x).toList(),
        "isActive": isActive,
      };
}

class PlanDriverTrip {
  PlanDriverTrip({
    required this.id,
    required this.driver,
    required this.planTripTemplate,
    required this.planTripStatus,
  });

  final int id;
  final Driver driver;
  final String planTripTemplate;
  final PlanTripStatus planTripStatus;

  factory PlanDriverTrip.fromJson(Map<String, dynamic> json) {
    return PlanDriverTrip(
      id: json["id"] ?? 0,
      driver: Driver.fromJson(json["driver"] ?? {}),
      planTripTemplate: json["planTripTemplate"] ?? "",
      planTripStatus: PlanTripStatus.values[json["planTripStatus"] ?? 0],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver": driver.toJson(),
        "planTripTemplate": planTripTemplate,
        "PlanTripStatus": planTripStatus.index,
      };
}

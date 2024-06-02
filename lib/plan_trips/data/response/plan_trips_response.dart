import '../../../companies/data/response/companies_response.dart';
import '../../../company_paths/data/response/company_paths_response.dart';
import '../../../global.dart';
import '../../../trip_process/data/response/trip_response.dart';

class PlanTripsResponse {
  PlanTripsResponse({
    required this.result,
  });

  final PlanTripsResult? result;

  factory PlanTripsResponse.fromJson(Map<String, dynamic> json) {
    return PlanTripsResponse(
      result:
          json["result"] == null ? null : PlanTripsResult.fromJson(json["result"]),
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

  final List<PlanTrip> items;
  final num totalCount;

  factory PlanTripsResult.fromJson(Map<String, dynamic> json) {
    return PlanTripsResult(
      items: json["items"] == null
          ? []
          : List<PlanTrip>.from(
              json["items"]!.map((x) => PlanTrip.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class PlanTripResponse {
  PlanTripResponse({
    required this.result,
  });

  final PlanTrip result;

  factory PlanTripResponse.fromJson(Map<String, dynamic> json) {
    return PlanTripResponse(result: PlanTrip.fromJson(json["result"] ?? {}));
  }

  Map<String, dynamic> toJson() => {"result": result.toJson()};
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
  final int companyPathId;
  final CompanyPath companyPath;
  final int companyId;
  final CompanyModel company;
  final String description;
  final List<PlanDriverTrip> driverTrips;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<WeekDays> days;
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
          : List<WeekDays>.from(
              json["days"]!.map((x) => WeekDays.values[x ?? 0])),
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
        "days": days.map((x) => x.index).toList(),
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
  final PlanTrip planTripTemplate;
  final PlanTripStatus planTripStatus;

  factory PlanDriverTrip.fromJson(Map<String, dynamic> json) {
    return PlanDriverTrip(
      id: json["id"] ?? 0,
      driver: Driver.fromJson(json["driver"] ?? {}),
      planTripTemplate: PlanTrip.fromJson(json["planTripTemplate"] ?? {}),
      planTripStatus: PlanTripStatus.values[json["planTripStatus"] ?? 0],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver": driver.toJson(),
        "planTripTemplate": planTripTemplate.toJson(),
        "PlanTripStatus": planTripStatus.index,
      };
}

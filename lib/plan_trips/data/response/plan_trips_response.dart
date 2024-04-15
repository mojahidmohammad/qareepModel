import '../../../companies/data/response/companies_response.dart';
import '../../../company_paths/data/response/company_paths_response.dart';
import '../../../global.dart';
import '../../../global.dart';
import '../../../global.dart';
import '../../../trip_path/data/models/trip_path.dart';
import '../../../trip_process/data/response/trip_response.dart';

class PlanTripsResponse {
  PlanTripsResponse({
    required this.result,
  });

  final PlanTripsResult result;

  factory PlanTripsResponse.fromJson(Map<String, dynamic> json) {
    return PlanTripsResponse(
      result: PlanTripsResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
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
    required this.planTrips,
    required this.isActive,
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
  final List<PlanTrip> planTrips;
  final bool isActive;

  factory PlanTripModel.fromJson(Map<String, dynamic> json) {
    return PlanTripModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      companyPathId: json["companyPathId"] ?? 0,
      companyPath: CompanyPath.fromJson(json["companyPath"] ?? {}),
      companyId: json["companyId"] ?? 0,
      description: json["description"] ?? "",
      company: CompanyModel.fromJson(json["company"] ?? {}),
      planTrips: json["planTrips"] == null
          ? []
          : List<PlanTrip>.from(json["planTrips"]!.map((x) => PlanTrip.fromJson(x))),
      isActive: json["isActive"] ?? false,
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
        "days": days.map((x) => x.index).toList(),
        "planTrips": planTrips.map((x) => x.toJson()).toList(),
        "isActive": isActive,
      };
}

class PlanTrip {
  PlanTrip({
    required this.id,
    required this.driver,
    required this.planTripTemplate,
    required this.planTripStatus,
  });

  final int id;
  final Driver driver;
  final PlanTripTemplate planTripTemplate;
  final PlanTripStatus planTripStatus;

  factory PlanTrip.fromJson(Map<String, dynamic> json) {
    return PlanTrip(
      id: json["id"] ?? 0,
      driver: Driver.fromJson(json["driver"] ?? {}),
      planTripTemplate: PlanTripTemplate.fromJson(json["planTripTemplate"] ?? {}),
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

class PlanTripTemplate {
  PlanTripTemplate({
    required this.id,
    required this.name,
    required this.companyPathId,
    required this.companyPath,
    required this.companyId,
    required this.company,
    required this.description,
    required this.planTrips,
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
  final List<String> planTrips;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<WeekDays> days;
  final bool isActive;

  factory PlanTripTemplate.fromJson(Map<String, dynamic> json) {
    return PlanTripTemplate(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      companyPathId: json["companyPathId"] ?? 0,
      companyPath: CompanyPath.fromJson(json["companyPath"] ?? {}),
      companyId: json["companyId"] ?? 0,
      company: CompanyModel.fromJson(json["company"] ?? {}),
      description: json["description"] ?? "",
      planTrips: json["planTrips"] == null
          ? []
          : List<String>.from(json["planTrips"]!.map((x) => x)),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      days: json["days"] == null
          ? <WeekDays>[]
          : List<WeekDays>.from(json["days"]!.map((x) => WeekDays.values[x])),
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
        "planTrips": planTrips.map((x) => x).toList(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "days": days.map((x) => x.index).toList(),
        "isActive": isActive,
      };
}

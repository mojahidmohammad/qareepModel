import '../../../trip_process/data/response/trip_response.dart';
import 'enrollments.dart';

class PlanAttendancesResponse {
  PlanAttendancesResponse({
    required this.result,
  });

  final PlanAttendanceResult result;

  factory PlanAttendancesResponse.fromJson(Map<String, dynamic> json) {
    return PlanAttendancesResponse(
      result: PlanAttendanceResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class PlanAttendanceResult {
  PlanAttendanceResult({
    required this.items,
    required this.totalCount,
  });

  final List<PlanAttendance> items;
  final int totalCount;

  factory PlanAttendanceResult.fromJson(Map<String, dynamic> json) {
    return PlanAttendanceResult(
      items: json["items"] == null
          ? []
          : List<PlanAttendance>.from(
              json["items"]!.map((x) => PlanAttendance.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class PlanAttendance {
  PlanAttendance({
    required this.user,
    required this.id,
    required this.enrollmentId,
    required this.planTripId,
    required this.driverId,
    required this.date,
    required this.driver,
    required this.enrollment,
    required this.consumedMeters,
  });

  final User user;
  final int id;
  final int enrollmentId;
  final int planTripId;
  final int driverId;
  final DateTime? date;
  final Driver driver;
  final Enrollment enrollment;
  final num consumedMeters;

  factory PlanAttendance.fromJson(Map<String, dynamic> json) {
    return PlanAttendance(
      user: User.fromJson(json["user"] ?? {}),
      id: json["id"] ?? 0,
      enrollmentId: json["enrollmentId"] ?? 0,
      planTripId: json["planTripId"] ?? 0,
      driverId: json["driverId"] ?? 0,
      date: DateTime.tryParse(json["date"] ?? ""),
      driver: Driver.fromJson(json["driver"] ?? {}),
      enrollment: Enrollment.fromJson(json["enrollment"] ?? {}),
      consumedMeters: json["consumedMeters"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "id": id,
        "enrollmentId": enrollmentId,
        "planTripId": planTripId,
        "driverId": driverId,
        "date": date?.toIso8601String(),
        "driver": driver.toJson(),
        "enrollment": enrollment.toJson(),
        "consumedMeters": consumedMeters,
      };
}

import 'package:qareeb_models/global.dart';
import 'package:qareeb_models/institutions/data/response/template_trips_response.dart';

import '../../../points/data/model/trip_point.dart';
import '../../../trip_path/data/models/trip_path.dart';

class ParticipationResponse {
  ParticipationResponse({
    required this.result,
  });

  final List<ParticipationResult> result;

  factory ParticipationResponse.fromJson(Map<String, dynamic> json) {
    return ParticipationResponse(
      result: json["result"] == null
          ? []
          : List<ParticipationResult>.from(
              json["result"]!.map((x) => ParticipationResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class ParticipationResult {
  ParticipationResult({
    required this.id,
    required this.busTripId,
    required this.busMemberId,
    required this.notificationPoints,
    required this.busTrip,
  });

  final int id;
  final num busTripId;
  final num busMemberId;
  final List<TripPoint> notificationPoints;
  final BusTrip busTrip;

  factory ParticipationResult.fromJson(Map<String, dynamic> json) {
    return ParticipationResult(
      id: json["id"] ?? 0,
      busTripId: json["busTripId"] ?? 0,
      busMemberId: json["busMemberId"] ?? 0,
      notificationPoints: json["notificationPoints"] == null
          ? []
          : List<TripPoint>.from(
              json["notificationPoints"]!.map((x) => TripPoint.fromJson(x))),
      busTrip: BusTrip.fromJson(json["busTrip"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "busTripId": busTripId,
        "busMemberId": busMemberId,
        "notificationPoints": notificationPoints.map((x) => x.toJson()).toList(),
        "busTrip": busTrip.toJson(),
      };
}

class BusTrip {
  BusTrip({
    required this.id,
    required this.name,
    required this.tripTemplateId,
    required this.institutionId,
    required this.pathId,
    required this.path,
    required this.description,
    required this.distance,
    required this.buses,
    required this.creationDate,
    required this.startDate,
    required this.endDate,
    required this.busTripType,
    required this.days,
    required this.attendances,
  });

  final int id;
  final String name;
  final num tripTemplateId;
  final num institutionId;
  final num pathId;
  final TripPath path;
  final String description;
  final num distance;
  final List<BusModel> buses;
  final DateTime? creationDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final BusTripType busTripType;
  final List<WeekDays> days;
  final List<Attendance> attendances;

  factory BusTrip.fromJson(Map<String, dynamic> json) {
    return BusTrip(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      tripTemplateId: json["tripTemplateId"] ?? 0,
      institutionId: json["institutionId"] ?? 0,
      pathId: json["pathId"] ?? 0,
      path: TripPath.fromJson(json["path"] ?? {}),
      description: json["description"] ?? "",
      distance: json["distance"] ?? 0,
      buses: json["buses"] == null
          ? []
          : List<BusModel>.from(json["buses"]!.map((x) => BusModel.fromJson(x))),
      creationDate: DateTime.tryParse(json["creationDate"] ?? ""),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      busTripType: BusTripType.values[json["busTripType"] ?? 0],
      days: json["days"] == null
          ? []
          : List<WeekDays>.from(json["days"]!.map((x) => WeekDays.values[x])),
      attendances: json["attendances"] == null
          ? []
          : List<Attendance>.from(
              json["attendances"]!.map((x) => Attendance.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tripTemplateId": tripTemplateId,
        "institutionId": institutionId,
        "pathId": pathId,
        "path": path.toJson(),
        "description": description,
        "distance": distance,
        "buses": buses.map((x) => x.toJson()).toList(),
        "creationDate": creationDate?.toIso8601String(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "busTripType": busTripType,
        "days": days.map((x) => x).toList(),
        "attendances": attendances.map((x) => x.toJson()).toList(),
      };
}

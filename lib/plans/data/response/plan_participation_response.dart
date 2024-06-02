import 'package:qareeb_models/global.dart';
import 'package:qareeb_models/institutions/data/response/template_trips_response.dart';

import '../../../plan_trips/data/response/plan_trips_response.dart';
import '../../../points/data/model/trip_point.dart';
import '../../../trip_path/data/models/trip_path.dart';

class PlanParticipationResponse {
  PlanParticipationResponse({
    required this.result,
  });

  final List<PlanParticipationResult> result;

  factory PlanParticipationResponse.fromJson(Map<String, dynamic> json) {
    return PlanParticipationResponse(
      result: json["result"] == null
          ? []
          : List<PlanParticipationResult>.from(
              json["result"]!.map((x) => PlanParticipationResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class PlanParticipationResult {
  PlanParticipationResult({
    required this.id,
    required this.planTripId,
    required this.userId,
    required this.notificationPoints,
    required this.planTrip,
  });

  final int id;
  final int planTripId;
  final int userId;
  final List<TripPoint> notificationPoints;
  final PlanDriverTrip planTrip;

  factory PlanParticipationResult.fromJson(Map<String, dynamic> json) {
    return PlanParticipationResult(
      id: json["id"] ?? 0,
      planTripId: json["planTripId"] ?? 0,
      userId: json["userId"] ?? 0,
      notificationPoints: json["notificationPoints"] == null
          ? []
          : List<TripPoint>.from(
              json["notificationPoints"]!.map((x) => TripPoint.fromJson(x))),
      planTrip: PlanDriverTrip.fromJson(json["planTrip"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "planTripId": planTripId,
        "userId": userId,
        "notificationPoints":
            notificationPoints.map((x) => x.toJson()).toList(),
        "planTrip": planTrip.toJson(),
      };
}

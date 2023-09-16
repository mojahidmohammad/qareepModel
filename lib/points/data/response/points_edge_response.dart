
import '../../../trip_path/data/models/trip_path.dart';
import '../model/trip_point.dart';

class PointsEdgeResponse {
  PointsEdgeResponse({
    required this.result,
  });

  final Edge result;

  factory PointsEdgeResponse.fromJson(Map<String, dynamic> json) {
    return PointsEdgeResponse(
      result: Edge.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}


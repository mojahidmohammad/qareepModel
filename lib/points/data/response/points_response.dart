import '../model/trip_point.dart';

class PointsResponse {
  PointsResponse({
    required this.result,
  });

  final PointsResult result;

  factory PointsResponse.fromJson(Map<String, dynamic> json) {
    return PointsResponse(
      result: PointsResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class PointsResult {
  PointsResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<TripPoint> items;

  factory PointsResult.fromJson(Map<String, dynamic> json) {
    return PointsResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<TripPoint>.from(json["items"]!.map((x) => TripPoint.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items.map((x) => x.toJson()).toList(),
      };
}


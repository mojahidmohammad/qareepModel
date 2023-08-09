import '../../../trip_process/data/response/trip_response.dart';

class TripsResponse {
  TripsResponse({
    required this.result,
  });

  final TripsResult? result;

  factory TripsResponse.fromJson(Map<String, dynamic> json) {
    return TripsResponse(
      result: json["result"] == null ? null : TripsResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class TripsResult {
  TripsResult({
    required this.items,
    required this.totalCount,
  });

  final List<TripResult> items;
  final num totalCount;

  factory TripsResult.fromJson(Map<String, dynamic> json) {
    return TripsResult(
      items: json["items"] == null
          ? []
          : List<TripResult>.from(json["items"]!.map((x) => TripResult.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

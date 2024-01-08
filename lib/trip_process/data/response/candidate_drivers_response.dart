import 'package:qareeb_models/trip_process/data/response/trip_response.dart';

class CandidateDriversResponse {
  CandidateDriversResponse({
    required this.result,
  });

  final List<CandidateDriver> result;

  factory CandidateDriversResponse.fromJson(Map<String, dynamic> json) {
    return CandidateDriversResponse(
      result: json["result"] == null
          ? []
          : List<CandidateDriver>.from(
              json["result"]!.map((x) => CandidateDriver.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class CandidateDriver {
  CandidateDriver({
    required this.id,
    required this.driverId,
    required this.tripId,
    required this.requestDate,
    required this.isRejected,
    required this.receivingDate,
    required this.isAccepted,
    required this.driver,
  });

  final int id;
  final num driverId;

  final num tripId;
  final DateTime? requestDate;
  final bool isRejected;
  final DateTime? receivingDate;
  final bool isAccepted;
  final Driver driver;

  factory CandidateDriver.fromJson(Map<String, dynamic> json) {
    return CandidateDriver(
      id: json["id"] ?? 0,
      driver: Driver.fromJson(json["driver"] ?? {}),
      driverId: json["driverId"] ?? 0,
      tripId: json["tripId"] ?? 0,
      requestDate: DateTime.tryParse(json["requestDate"] ?? ""),
      isRejected: json["isRejected"] ?? false,
      receivingDate: DateTime.tryParse(json["receivingDate"] ?? ""),
      isAccepted: json["isAccepted"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver": driver.toJson(),
        "driverId": driverId,
        "tripId": tripId,
        "requestDate": requestDate?.toIso8601String(),
        "isRejected": isRejected,
        "receivingDate": receivingDate?.toIso8601String(),
        "isAccepted": isAccepted,
      };
}

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
    required this.driverName,
    required this.tripId,
    required this.requestDate,
    required this.isRejected,
    required this.isAccepted,
  });

  final int id;
  final num driverId;
  final String driverName;
  final num tripId;
  final DateTime? requestDate;
  final bool? isRejected;
  final bool? isAccepted;

  factory CandidateDriver.fromJson(Map<String, dynamic> json) {
    return CandidateDriver(
      id: json["id"] ?? 0,
      driverId: json["driverId"] ?? 0,
      driverName: json["driverName"] ?? '',
      tripId: json["tripId"] ?? 0,
      requestDate: DateTime.tryParse(json["requestDate"] ?? ""),
      isRejected: json["isRejected"] ,
      isAccepted: json["isAccepted"] ,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverId": driverId,
        "driverName": driverName,
        "tripId": tripId,
        "requestDate": requestDate?.toIso8601String(),
        "isRejected": isRejected,
        "isAccepted": isAccepted,
      };
}

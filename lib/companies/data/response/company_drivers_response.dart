class CompanyDriversResponse {
  CompanyDriversResponse({
    required this.result,
  });

  final List<CompanyDriver> result;

  factory CompanyDriversResponse.fromJson(Map<String, dynamic> json) {
    return CompanyDriversResponse(
      result: json["result"] == null
          ? []
          : List<CompanyDriver>.from(
              json["result"]!.map((x) => CompanyDriver.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class CompanyDriver {
  CompanyDriver({
    required this.tripId,
    required this.imei,
    required this.type,
  });

  final num tripId;
  final String imei;
  final int type;

  factory CompanyDriver.fromJson(Map<String, dynamic> json) {
    return CompanyDriver(
      tripId: json["tripId"] ?? 0,
      imei: json["imei"] ?? "",
      type: json["type"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "imei": imei,
        "type": type,
      };
}

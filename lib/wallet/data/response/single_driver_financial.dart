class SingleFinancialResponse {
  SingleFinancialResponse({
    required this.result,
  });

  final FinancialResult result;

  factory SingleFinancialResponse.fromJson(Map<String, dynamic> json){
    return SingleFinancialResponse(
      result:  FinancialResult.fromJson(json["result"]??{}),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
  };

}

class FinancialReportResponse {
  FinancialReportResponse({
    required this.result,
  });

  final FinancialReportResult result;

  factory FinancialReportResponse.fromJson(Map<String, dynamic> json) {
    return FinancialReportResponse(
      result:  FinancialReportResult.fromJson(json["result"]??{}),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
  };
}

class FinancialReportResult {
  FinancialReportResult({
    required this.items,
    required this.totalCount,
  });

  final List<FinancialResult> items;
  final int totalCount;

  factory FinancialReportResult.fromJson(Map<String, dynamic> json) {
    return FinancialReportResult(
      items: json["items"] == null
          ? []
          : List<FinancialResult>.from(json["items"]!.map((x) => FinancialResult.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "items": items.map((x) => x.toJson()).toList(),
    "totalCount": totalCount,
  };
}

class FinancialResult {
  FinancialResult({
    required this.driverId,
    required this.driverName,
    required this.driverPhoneNo,
    required this.requiredAmountFromDriver,
    required this.requiredAmountFromCompany,
  });

  final int driverId;
  final String driverName;
  final String driverPhoneNo;
  final num requiredAmountFromDriver;
  final num requiredAmountFromCompany;

  factory FinancialResult.fromJson(Map<String, dynamic> json){
    return FinancialResult(
      driverId: json["driverId"] ?? 0,
      driverName: json["driverName"] ?? "",
      driverPhoneNo: json["driverPhoneNo"] ?? "",
      requiredAmountFromDriver: json["requiredAmountFromDriver"] ?? 0,
      requiredAmountFromCompany: json["requiredAmountFromCompany"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "driverName": driverName,
    "driverPhoneNo": driverPhoneNo,
    "requiredAmountFromDriver": requiredAmountFromDriver,
    "requiredAmountFromCompany": requiredAmountFromCompany,
  };

}

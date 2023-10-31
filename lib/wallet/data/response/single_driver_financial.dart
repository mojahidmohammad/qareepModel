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
    required this.totalRequiredAmountFromDriver,
    required this.totalRequiredAmountFromCompany,
  });

  final List<FinancialResult> items;
  final int totalCount;
  final num totalRequiredAmountFromDriver;
  final num totalRequiredAmountFromCompany;

  factory FinancialReportResult.fromJson(Map<String, dynamic> json) {
    return FinancialReportResult(
      items: json["reports"] == null
          ? []
          : List<FinancialResult>.from(json["reports"]!.map((x) => FinancialResult.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
      totalRequiredAmountFromDriver: json["TotalRequiredAmountFromDriver"] ?? 0,
      totalRequiredAmountFromCompany: json["TotalRequiredAmountFromCompany"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "reports": items.map((x) => x.toJson()).toList(),
    "totalCount": totalCount,
    "TotalRequiredAmountFromDriver": totalRequiredAmountFromDriver,
    "TotalRequiredAmountFromCompany": totalRequiredAmountFromCompany,
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
      driverId: json["DriverId"] ?? 0,
      driverName: json["DriverName"] ?? "",
      driverPhoneNo: json["DriverPhoneNo"] ?? "",
      requiredAmountFromDriver: json["RequiredAmountFromDriver"] ?? 0,
      requiredAmountFromCompany: json["RequiredAmountFromCompany"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "DriverId": driverId,
    "DriverName": driverName,
    "DriverPhoneNo": driverPhoneNo,
    "RequiredAmountFromDriver": requiredAmountFromDriver,
    "RequiredAmountFromCompany": requiredAmountFromCompany,
  };

}

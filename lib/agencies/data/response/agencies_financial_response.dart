import '../../../wallet/data/response/wallet_response.dart';

class AgenciesFinancialResponse {
  AgenciesFinancialResponse({
    required this.result,
  });

  final AgenciesFinancialResult result;

  factory AgenciesFinancialResponse.fromJson(Map<String, dynamic> json) {
    return AgenciesFinancialResponse(
      result: AgenciesFinancialResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class AgenciesFinancialResult {
  AgenciesFinancialResult({
    required this.reports,
    required this.totalRequiredAmountFromCompany,
  });

  final List<AgencyReport> reports;
  final num totalRequiredAmountFromCompany;

  factory AgenciesFinancialResult.fromJson(Map<String, dynamic> json) {
    return AgenciesFinancialResult(
      reports: json["reports"] == null
          ? []
          : List<AgencyReport>.from(
              json["reports"]!.map((x) => AgencyReport.fromJson(x))),
      totalRequiredAmountFromCompany: json["totalRequiredAmountFromCompany"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "reports": reports.map((x) => x.toJson()).toList(),
        "totalRequiredAmountFromCompany": totalRequiredAmountFromCompany,
      };
}

class AgencyReport {
  AgencyReport({
    required this.agencyId,
    required this.agencyName,
    required this.agencyRatio,
    required this.transactions,
    required this.requiredAmountFromCompany,
  });

  final int agencyId;
  final String agencyName;
  final num agencyRatio;
  final List<Transaction> transactions;
  final num requiredAmountFromCompany;

  factory AgencyReport.fromJson(Map<String, dynamic> json) {
    return AgencyReport(
      agencyId: json["agencyId"] ?? 0,
      agencyName: json["agencyName"] ?? "",
      agencyRatio: json["agencyRatio"] ?? 0,
      transactions: json["transactions"] == null
          ? []
          : List<Transaction>.from(
              json["transactions"]!.map((x) => Transaction.fromJson(x))),
      requiredAmountFromCompany: json["requiredAmountFromCompany"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "agencyId": agencyId,
        "agencyName": agencyName,
        "agencyRatio": agencyRatio,
        "transactions": transactions.map((x) => x.toJson()).toList(),
        "requiredAmountFromCompany": requiredAmountFromCompany,
      };
}



import 'package:qareeb_models/wallet/data/response/single_driver_financial.dart';
import 'package:qareeb_models/wallet/data/response/wallet_response.dart';

import 'debt_response.dart';

class DriverFinancialResponse {
  DriverFinancialResponse({
    required this.result,
  });

  final DriverFinancialResult result;

  factory DriverFinancialResponse.fromJson(Map<String, dynamic> json) {
    return DriverFinancialResponse(
      result: DriverFinancialResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class DriverFinancialResult {
  DriverFinancialResult({
    required this.debts,
    required this.charging,
    required this.lastTransferFromDriver,
    required this.lastTransferFromCompanyToDriver,
    required this.requiredAmountFromDriver,
    required this.requiredAmountFromCompany,
  });

  final List<Debt> debts;
  final List<Charging> charging;
  final Transaction lastTransferFromDriver;
  final Transaction lastTransferFromCompanyToDriver;
  final num requiredAmountFromDriver;
  final num requiredAmountFromCompany;

  factory DriverFinancialResult.fromJson(Map<String, dynamic> json) {
    return DriverFinancialResult(
      debts: json["debts"] == null
          ? []
          : List<Debt>.from(json["debts"]!.map((x) => Debt.fromJson(x))),
      charging: json["chargings"] == null
          ? []
          : List<Charging>.from(json["chargings"]!.map((x) => Charging.fromJson(x))),
      lastTransferFromDriver: Transaction.fromJson(json["lastTransferFromDriver"] ?? {}),
      lastTransferFromCompanyToDriver:
          Transaction.fromJson(json["lastTransferFromCompanyToDriver"] ?? {}),
      requiredAmountFromDriver: json["requiredAmountFromDriver"] ?? 0,
      requiredAmountFromCompany: json["requiredAmountFromCompany"] ?? 0,
    );
  }

  factory DriverFinancialResult.fromFinancialResult(FinancialResult result) {
    return DriverFinancialResult(
      debts: [],
      charging: [],
      lastTransferFromDriver: Transaction.fromJson({}),
      lastTransferFromCompanyToDriver: Transaction.fromJson({}),
      requiredAmountFromDriver: result.requiredAmountFromDriver,
      requiredAmountFromCompany: result.requiredAmountFromCompany,
    );
  }

  Map<String, dynamic> toJson() => {
        "debts": debts.map((x) => x.toJson()).toList(),
        "chargings": charging.map((x) => x.toJson()).toList(),
        "lastTransferFromDriver": lastTransferFromDriver.toJson(),
        "lastTransferFromCompanyToDriver": lastTransferFromCompanyToDriver.toJson(),
        "requiredAmountFromDriver": requiredAmountFromDriver,
        "requiredAmountFromCompany": requiredAmountFromCompany,
      };
}

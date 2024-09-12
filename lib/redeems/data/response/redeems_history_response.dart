import '../../../global.dart';

class RedeemsHistoryResponse {
  RedeemsHistoryResponse({
    required this.result,
  });

  final RedeemsHistoryResult result;

  factory RedeemsHistoryResponse.fromJson(Map<String, dynamic> json) {
    return RedeemsHistoryResponse(
      result: RedeemsHistoryResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class RedeemsHistoryResult {
  RedeemsHistoryResult({
    required this.items,
    required this.totalCount,
  });

  final List<RedeemHistory> items;
  final num totalCount;

  factory RedeemsHistoryResult.fromJson(Map<String, dynamic> json) {
    return RedeemsHistoryResult(
      items: json["items"] == null
          ? []
          : List<RedeemHistory>.from(
              json["items"]!.map((x) => RedeemHistory.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class RedeemHistory {
  RedeemHistory({
    required this.id,
    required this.driverId,
    required this.type,
    required this.meters,
    required this.redeemDate,
    required this.aggregatedMoney,
  });

  final int id;
  final int driverId;
  final RedeemType type;
  final num meters;
  final DateTime? redeemDate;
  final num aggregatedMoney;

  factory RedeemHistory.fromJson(Map<String, dynamic> json) {
    return RedeemHistory(
      id: json["id"] ?? 0,
      driverId: json["driverId"] ?? 0,
      type: RedeemType.values[json["type"] ?? 0],
      meters: json["meters"] ?? 0,
      redeemDate: DateTime.tryParse(json["redeemDate"] ?? ""),
      aggregatedMoney: json["aggregatedMoney"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverId": driverId,
        "type": type.index,
        "meters": meters,
        "redeemDate": redeemDate?.toIso8601String(),
        "aggregatedMoney": aggregatedMoney,
      };
}

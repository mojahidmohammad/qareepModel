import '../../../global.dart';

class WalletResponse {
  WalletResponse({
    required this.result,
  });

  final WalletResult result;

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      result: WalletResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class WalletResult {
  WalletResult({
    required this.id,
    required this.totalMoney,
    required this.name,
    required this.userId,
    required this.chargings,
    required this.transactions,
  });

  final int id;
  final double totalMoney;
  final String name;
  final num userId;
  final List<Charging> chargings;
  final List<Transaction> transactions;

  factory WalletResult.fromJson(Map<String, dynamic> json) {
    return WalletResult(
      id: json["id"] ?? 0,
      totalMoney: json["totalMoney"] ?? 0,
      name: json["name"] ?? "",
      userId: json["userId"] ?? 0,
      chargings: json["chargings"] == null
          ? []
          : List<Charging>.from(json["chargings"]!.map((x) => Charging.fromJson(x)))
              .reversed
              .toList(),
      transactions: json["transactions"] == null
          ? []
          : List<Transaction>.from(
                  json["transactions"]!.map((x) => Transaction.fromJson(x)))
              .reversed
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalMoney": totalMoney,
        "name": name,
        "userId": userId,
        "chargings": chargings.map((x) => x.toJson()).toList(),
        "transactions": transactions.map((x) => x.toJson()).toList(),
      };
}

class Charging {
  Charging({
    required this.id,
    required this.date,
    required this.status,
    required this.amount,
    required this.accountId,
    required this.paymentSourceId,
    required this.type,
    required this.userName,
    required this.clientPhone,
    required this.providerName,
    required this.chargerId,
    required this.chargerName,
    required this.chargerPhone,
    required this.processId,
  });

  final int id;
  final DateTime? date;
  final TransferStatus status;
  final num amount;
  final num accountId;
  final num paymentSourceId;
  final TransferType type;
  final String userName;
  final String clientPhone;
  final String providerName;
  final num chargerId;
  final String chargerName;
  final String chargerPhone;
  final String processId;

  factory Charging.fromJson(Map<String, dynamic> json) {
    return Charging(
      id: json["id"] ?? 0,
      date: DateTime.tryParse(json["date"] ?? ""),
      status: TransferStatus.values[json["status"] ?? 0],
      amount: json["amount"] ?? 0,
      accountId: json["accountId"] ?? 0,
      paymentSourceId: json["paymentSourceId"] ?? 0,
      type: TransferType.values[json["type"] ?? 0],
      userName: json["userName"] ?? "",
      clientPhone: json["clientPhone"] ?? "",
      providerName: json["providerName"] ?? "",
      chargerId: json["chargerId"] ?? 0,
      chargerName: json["chargerName"] ?? "",
      chargerPhone: json["chargerPhone"] ?? "",
      processId: json["proccessId"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "status": status.index,
        "amount": amount,
        "accountId": accountId,
        "paymentSourceId": paymentSourceId,
        "type": type.index,
        "userName": userName,
        "clientPhone": clientPhone,
        "providerName": providerName,
        "chargerId": chargerId,
        "chargerName": chargerName,
        "chargerPhone": chargerPhone,
        "proccessId": processId,
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.status,
    required this.transferDate,
    required this.sourceId,
    required this.sourceName,
    required this.destinationId,
    required this.destinationName,
    required this.amount,
    required this.type,
    required this.tripId,
    required this.sharedRequestId,
    required this.note,
  });

  final int id;
  final TransferStatus status;
  final DateTime? transferDate;
  final num sourceId;
  final String sourceName;
  final num destinationId;
  final String destinationName;
  final num amount;
  final TransferType type;
  final num tripId;
  final num sharedRequestId;
  final String note;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"] ?? 0,
      status: TransferStatus.values[json["status"] ?? 0],
      transferDate: DateTime.tryParse(json["transferDate"] ?? ""),
      sourceId: json["sourceId"] ?? 0,
      sourceName: json["sourceName"] ?? "",
      destinationId: json["destinationId"] ?? 0,
      destinationName: json["destinationName"] ?? "",
      amount: json["amount"] ?? 0,
      type: TransferType.values[json["type"] ?? 0],
      tripId: json["tripId"] ?? 0,
      sharedRequestId: json["sharedRequestId"] ?? 0,
      note: json["note"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status.index,
        "transferDate": transferDate?.toIso8601String(),
        "sourceId": sourceId,
        "sourceName": sourceName,
        "destinationId": destinationId,
        "destinationName": destinationName,
        "amount": amount,
        "type": type.index,
        "tripId": tripId,
        "sharedRequestId": sharedRequestId,
        "note": note,
      };
}

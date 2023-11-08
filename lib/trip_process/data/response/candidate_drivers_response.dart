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
    required this.isAccepted,
    required this.driver,
  });

  final int id;
  final num driverId;

  final num tripId;
  final DateTime? requestDate;
  final bool isRejected;
  final bool isAccepted;
  final Driver driver;

  factory CandidateDriver.fromJson(Map<String, dynamic> json) {
    return CandidateDriver(
      id: json["id"] ?? 0,
      driver: Driver.fromJson(json["driver"] ?? {}),
      driverId: json["driverId"] ?? 0,
      tripId: json["tripId"] ?? 0,
      requestDate: DateTime.tryParse(json["requestDate"] ?? ""),
      isRejected: json["isRejected"]??false,
      isAccepted: json["isAccepted"]??false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver": driver.toJson(),
        "driverId": driverId,
        "tripId": tripId,
        "requestDate": requestDate?.toIso8601String(),
        "isRejected": isRejected,
        "isAccepted": isAccepted,
      };
}

class Driver {
  Driver({
    required this.id,
    required this.fullName,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.imei,
    required this.avatar,
    required this.rating,
    required this.lastSeen,
    required this.activeFrom,
    required this.isLoyaltySupscriper,
    required this.isGasIncluded,
    required this.carType,
  });

  final int id;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String imei;
  final String avatar;
  final num rating;
  final DateTime? lastSeen;
  final DateTime? activeFrom;
  final bool isLoyaltySupscriper;
  final bool isGasIncluded;
  final CarType carType;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"] ?? 0,
      fullName: json["fullName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      imei: json["imei"] ?? "",
      avatar: json["avatar"] ?? "",
      rating: json["rating"] ?? 0,
      lastSeen: DateTime.tryParse(json["lastSeen"] ?? ""),
      activeFrom: DateTime.tryParse(json["activeFrom"] ?? ""),
      isLoyaltySupscriper: json["isLoyaltySupscriper"] ?? false,
      isGasIncluded: json["isGasIncluded"] ?? false,
      carType: CarType.fromJson(json["carType"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "imei": imei,
        "avatar": avatar,
        "rating": rating,
        "lastSeen": lastSeen?.toIso8601String(),
        "activeFrom": activeFrom?.toIso8601String(),
        "isLoyaltySupscriper": isLoyaltySupscriper,
        "isGasIncluded": isGasIncluded,
        "carType": carType.toJson(),
      };
}

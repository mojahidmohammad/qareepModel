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

class Driver {
  Driver({
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
    required this.isExaminated,
    required this.examination,
    required this.id,
  });

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
  final CarType? carType;
  final bool isExaminated;
  final String examination;
  final int id;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
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
      carType: json["carType"] == null ? null : CarType.fromJson(json["carType"]),
      isExaminated: json["isExaminated"] ?? false,
      examination: json["examination"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
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
        "carType": carType?.toJson(),
        "isExaminated": isExaminated,
        "examination": examination,
        "id": id,
      };
}

class CarType {
  CarType({
    required this.userId,
    required this.carBrand,
    required this.carModel,
    required this.carColor,
    required this.carNumber,
    required this.seatsNumber,
    required this.carGovernorate,
    required this.manufacturingYear,
    required this.type,
  });

  final num userId;
  final String carBrand;
  final String carModel;
  final String carColor;
  final String carNumber;
  final num seatsNumber;
  final String carGovernorate;
  final String manufacturingYear;
  final String type;

  factory CarType.fromJson(Map<String, dynamic> json) {
    return CarType(
      userId: json["userId"] ?? 0,
      carBrand: json["carBrand"] ?? "",
      carModel: json["carModel"] ?? "",
      carColor: json["carColor"] ?? "",
      carNumber: json["carNumber"] ?? "",
      seatsNumber: json["seatsNumber"] ?? 0,
      carGovernorate: json["carGovernorate"] ?? "",
      manufacturingYear: json["manufacturingYear"] ?? "",
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "carBrand": carBrand,
        "carModel": carModel,
        "carColor": carColor,
        "carNumber": carNumber,
        "seatsNumber": seatsNumber,
        "carGovernorate": carGovernorate,
        "manufacturingYear": manufacturingYear,
        "type": type,
      };
}

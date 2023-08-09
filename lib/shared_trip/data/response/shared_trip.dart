

import '../../../points/data/model/trip_point.dart';
import '../../../trip_path/data/models/trip_path.dart';

class SharedTripResponse {
  SharedTripResponse({
    required this.result,
  });

  final SharedTrip result;

  factory SharedTripResponse.fromJson(Map<String, dynamic> json) {
    return SharedTripResponse(
      result: SharedTrip.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class SharedTrip {
  SharedTrip({
    required this.id,
    required this.driverId,
    required this.pathId,
    required this.path,
    required this.sharedRequests,
    required this.creationDate,
    required this.schedulingDate,
    required this.startDate,
    required this.endDate,
    required this.tripStatus,
    required this.seatsNumber,
    required this.seatCost,
    required this.totalCost,
    required this.note,
    required this.driver,
    required this.availableSeats,
    required this.reservedSeats,
  });

  final int id;
  final num driverId;
  final num pathId;
  final TripPath path;
  final List<SharedRequest> sharedRequests;
  final DateTime? creationDate;
  final DateTime? schedulingDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic tripStatus;
  final num seatsNumber;
  final num seatCost;
  final num totalCost;
  final String note;
  final Driver driver;
  final num availableSeats;
  final num reservedSeats;

  int status() {
    if (tripStatus == null) return 0;

    if (tripStatus is num) {
      return tripStatus;
    } else if (tripStatus is String) {
      return int.parse(tripStatus);
    }
    return 0;
  }

  factory SharedTrip.fromJson(Map<String, dynamic> json) {
    return SharedTrip(
      id: json["id"] ?? 0,
      driverId: json["driverId"] ?? 0,
      pathId: json["pathId"] ?? 0,
      path: TripPath.fromJson(json["path"] ?? {}),
      sharedRequests: json["sharedRequests"] == null
          ? []
          : List<SharedRequest>.from(
              json["sharedRequests"]!.map((x) => SharedRequest.fromJson(x))),
      creationDate: DateTime.tryParse(json["creationDate"] ?? ""),
      schedulingDate: DateTime.tryParse(json["schedulingDate"] ?? ""),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      tripStatus: json["tripStatus"],
      seatsNumber: json["seatsNumber"] ?? 0,
      seatCost: json["seatCost"] ?? 0,
      totalCost: json["totalCost"] ?? 0,
      availableSeats: json["availableSeats"] ?? 0,
      reservedSeats: json["reservedSeats"] ?? 0,
      note: json["note"] ?? "",
      driver: Driver.fromJson(json["driver"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverId": driverId,
        "pathId": pathId,
        "path": path.toJson(),
        "sharedRequests": sharedRequests.map((x) => x.toJson()).toList(),
        "creationDate": creationDate?.toIso8601String(),
        "schedulingDate": schedulingDate?.toIso8601String(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "tripStatus": tripStatus,
        "seatsNumber": seatsNumber,
        "seatCost": seatCost,
        "totalCost": totalCost,
        "availableSeats": availableSeats,
        "reservedSeats": reservedSeats,
        "note": note,
      };
}

class SharedRequest {
  SharedRequest({
    required this.id,
    required this.sharedTripId,
    required this.clientId,
    required this.status,
    required this.seatNumber,
    required this.dropPointId,
    required this.dropPoint,
    required this.pickupPointId,
    required this.pickupPoint,
    required this.amount,
  });

  final int id;
  final num sharedTripId;
  final num clientId;
  final int status;
  final int seatNumber;
  final num dropPointId;
  final TripPoint dropPoint;
  final num pickupPointId;
  final TripPoint pickupPoint;
  final num amount;

  factory SharedRequest.fromJson(Map<String, dynamic> json) {
    return SharedRequest(
      id: json["id"] ?? 0,
      sharedTripId: json["sharedTripId"] ?? 0,
      clientId: json["clientId"] ?? 0,
      status: json["status"] ?? 0,
      seatNumber: json["seatNumber"] ?? 0,
      dropPointId: json["dropPointId"] ?? 0,
      amount: json["amount"] ?? 0,
      dropPoint: TripPoint.fromJson(json["dropPoint"] ?? {}),
      pickupPointId: json["pickupPointId"] ?? 0,
      pickupPoint: TripPoint.fromJson(json["pickupPoint"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "sharedTripId": sharedTripId,
        "clientId": clientId,
        "status": status,
        "seatNumber": seatNumber,
        "dropPointId": dropPointId,
        "dropPoint": dropPoint.toJson(),
        "pickupPointId": pickupPointId,
        "amount": amount,
        "pickupPoint": pickupPoint.toJson(),
      };
}

class Driver {
  Driver({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.imei,
    required this.avatar,
    required this.carType,
  });

  final int id;
  final String userName;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String imei;
  final String avatar;
  final CarType carType;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"] ?? 0,
      userName: json["userName"] ?? "",
      fullName: json["fullName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      imei: json["imei"] ?? "",
      avatar: json["avatar"] ?? "",
      carType: CarType.fromJson(json["carType"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "fullName": fullName,
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "imei": imei,
        "avatar": avatar,
        "carType": carType.toJson(),
      };
}

class CarType {
  CarType({
    required this.userId,
    required this.carBrand,
    required this.carModel,
    required this.carColor,
    required this.carNumber,
  });

  final num userId;
  final String carBrand;
  final String carModel;
  final String carColor;
  final String carNumber;

  factory CarType.fromJson(Map<String, dynamic> json) {
    return CarType(
      userId: json["userId"] ?? 0,
      carBrand: json["carBrand"] ?? "",
      carModel: json["carModel"] ?? "",
      carColor: json["carColor"] ?? "",
      carNumber: json["carNumber"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "carBrand": carBrand,
        "carModel": carModel,
        "carColor": carColor,
        "carNumber": carNumber,
      };
}

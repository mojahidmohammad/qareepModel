import '../../../global.dart';
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
    required this.seatNumber,
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
  final SharedTripStatus tripStatus;
  final num seatNumber;
  final num seatCost;
  final num totalCost;
  final String note;
  final Driver driver;
  final num availableSeats;
  final num reservedSeats;

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
      tripStatus: SharedTripStatus
          .values[int.tryParse(json["tripStatus"]?.toString() ?? '0') ?? 0],
      seatNumber: json["seatNumber"] ?? 0,
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
        "seatNumber": seatNumber,
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
    required this.client,
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
  final Client client;
  final SharedRequestStatus status;
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
      client: Client.fromJson(json["client"] ?? {}),
      status:SharedRequestStatus.values[ json["status"] ?? 0],
      seatNumber: json["seatNumber"] ?? 0,
      dropPointId: json["dropPointId"] ?? 0,
      dropPoint: TripPoint.fromJson(json["dropPoint"] ?? {}),
      pickupPointId: json["pickupPointId"] ?? 0,
      pickupPoint: TripPoint.fromJson(json["pickupPoint"] ?? {}),
      amount: json["amount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "sharedTripId": sharedTripId,
        "clientId": clientId,
        "client": client.toJson(),
        "status": status.index,
        "seatNumber": seatNumber,
        "dropPointId": dropPointId,
        "dropPoint": dropPoint.toJson(),
        "pickupPointId": pickupPointId,
        "pickupPoint": pickupPoint.toJson(),
        "amount": amount,
      };
}

class Client {
  Client({
    required this.userName,
    required this.fullName,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.avatar,
  });

  final String userName;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String avatar;

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      userName: json["userName"] ?? "",
      fullName: json["fullName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "fullName": fullName,
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
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
    required this.rating,
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
  final num rating;
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
      rating: json["rating"] ?? 0,
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
        "rating": rating,
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
    required this.seatsNumber,
  });

  final num userId;
  final String carBrand;
  final String carModel;
  final String carColor;
  final String carNumber;
  final num seatsNumber;

  factory CarType.fromJson(Map<String, dynamic> json) {
    return CarType(
      userId: json["userId"] ?? 0,
      carBrand: json["carBrand"] ?? "",
      carModel: json["carModel"] ?? "",
      carColor: json["carColor"] ?? "",
      carNumber: json["carNumber"] ?? "",
      seatsNumber: json["seatsNumber"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "carBrand": carBrand,
        "carModel": carModel,
        "carColor": carColor,
        "carNumber": carNumber,
        "seatsNumber": seatsNumber,
      };
}

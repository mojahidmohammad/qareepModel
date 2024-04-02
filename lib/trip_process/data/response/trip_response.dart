import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../car_catigory/data/response/car_categories_response.dart';
import '../../../global.dart';
import '../../../shared_trip/data/response/shared_trip.dart';

class TripsResponse {
  TripsResponse({
    required this.result,
  });

  final TripResult result;

  factory TripsResponse.fromJson(Map<String, dynamic> json) {
    return TripsResponse(
      result: TripResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class TripResponse {
  TripResponse({
    required this.result,
  });

  final Trip result;

  factory TripResponse.fromJson(Map<String, dynamic> json) {
    return TripResponse(
      result: Trip.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class TripResult {
  TripResult({
    required this.items,
    required this.totalCount,
  });

  final List<Trip> items;
  final int totalCount;

  factory TripResult.fromJson(Map<String, dynamic> json) {
    return TripResult(
      items: json["items"] == null
          ? []
          : List<Trip>.from(json["items"]!.map((x) => Trip.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class Trip {
  Trip({
    required this.id,
    required this.client,
    required this.driver,
    required this.clientId,
    required this.driverId,
    required this.reqestDate,
    required this.schedulingDate,
    required this.acceptDate,
    required this.startDate,
    required this.endDate,
    required this.cancelDate,
    required this.sourceName,
    required this.source,
    required this.destinationName,
    required this.destination,
    required this.estimatedDistance,
    required this.estimatedDuration,
    required this.estimatedPath,
    required this.actualDistance,
    required this.actualDuration,
    required this.actualPath,
    required this.preAcceptLat,
    required this.preAcceptLng,
    required this.preAcceptDistance,
    required this.driverCompensation,
    required this.preAcceptPath,
    required this.tripRate,
    required this.reviewNote,
    required this.note,
    required this.tripType,
    required this.tripStatus,
    required this.estimatedCost,
    required this.actualCost,
    required this.isPaid,
    required this.cancelReasone,
    required this.carCategoryId,
    required this.carCategory,
    required this.discountValue,
    required this.couponCode,
    required this.tripStoppingPoints,
    required this.tripStoppingRecords,
    required this.enrollmentId,
  });

  final int id;
  final Client client;
  final Driver driver;
  final int clientId;
  final int driverId;
  final DateTime? reqestDate;
  final DateTime? schedulingDate;
  final DateTime? acceptDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? cancelDate;
  final String sourceName;
  final Destination source;
  final String destinationName;
  final Destination destination;
  final num estimatedDistance;
  final num estimatedDuration;
  final String estimatedPath;
  final num actualDistance;
  final num actualDuration;
  final String actualPath;
  final double preAcceptLat;
  final double preAcceptLng;
  final num preAcceptDistance;
  final num driverCompensation;
  final String preAcceptPath;
  final double tripRate;
  final String reviewNote;
  final String note;
  final TripType tripType;
  final TripStatus tripStatus;
  final num estimatedCost;
  final num actualCost;
  final bool isPaid;
  final String cancelReasone;
  final num carCategoryId;
  final CarCategory carCategory;
  final num discountValue;
  final String couponCode;
  final List<TripStoppingPoint> tripStoppingPoints;
  final List<TripStoppingRecord> tripStoppingRecords;
  final int enrollmentId;

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      client: Client.fromJson(json["client"] ?? {}),
      driver: Driver.fromJson(json["driver"] ?? {}),
      clientId: json["clientId"] ?? 0,
      id: json["id"] ?? 0,
      driverId: json["driverId"] ?? 0,
      reqestDate: DateTime.tryParse(json["reqestDate"] ?? ""),
      schedulingDate: DateTime.tryParse(json["schedulingDate"] ?? ""),
      acceptDate: DateTime.tryParse(json["acceptDate"] ?? ""),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      cancelDate: DateTime.tryParse(json["cancelDate"] ?? ""),
      sourceName: json["sourceName"] ?? "",
      source: Destination.fromJson(json["source"] ?? {}),
      destinationName: json["destinationName"] ?? "",
      destination: Destination.fromJson(json["destination"] ?? {}),
      estimatedDistance: json["estimatedDistance"] ?? 0,
      estimatedDuration: json["estimatedDuration"] ?? 0,
      estimatedPath: json["estimatedPath"] ?? "",
      actualDistance: json["actualDistance"] ?? 0,
      actualDuration: json["actualDuration"] ?? 0,
      actualPath: json["actualPath"] ?? "",
      preAcceptLat: json["preAcceptLatitud"] ?? 0,
      preAcceptLng: json["preAcceptLongitud"] ?? 0,
      preAcceptDistance: json["preAcceptDistance"] ?? 0,
      driverCompensation: json["driverCompensation"] ?? 0,
      preAcceptPath: json["preAcceptPath"] ?? "",
      tripRate: json["tripRate"] ?? 0,
      reviewNote: json["reviewNote"] ?? "",
      note: json["note"] ?? "",
      tripType: TripType.values[json["tripType"] ?? 0],
      tripStatus: TripStatus.values[json["tripStatus"] ?? 0],
      estimatedCost: json["estimatedCost"] ?? 0,
      actualCost: json["actualCost"] ?? 0,
      isPaid: (json["enrollmentId"] ?? 0) != 0 ? true : json["isPaid"] ?? false,
      cancelReasone: json["cancelReasone"] ?? "",
      carCategoryId: json["carCategoryId"] ?? 0,
      carCategory: CarCategory.fromJson(json["carCategory"] ?? {}),
      discountValue: json["discountValue"] ?? 0,
      couponCode: json["couponCode"] ?? '',
      tripStoppingPoints: json["tripStoppingPoints"] == null
          ? []
          : List<TripStoppingPoint>.from(
              json["tripStoppingPoints"]!.map((x) => TripStoppingPoint.fromJson(x))),
      tripStoppingRecords: json["tripStoppingRecords"] == null
          ? []
          : List<TripStoppingRecord>.from(
              json["tripStoppingRecords"]!.map((x) => TripStoppingRecord.fromJson(x))),
      enrollmentId: json["enrollmentId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "client": client.toJson(),
        "driver": driver.toJson(),
        "clientId": clientId,
        "driverId": driverId,
        "reqestDate": reqestDate?.toIso8601String(),
        "schedulingDate": schedulingDate?.toIso8601String(),
        "acceptDate": acceptDate?.toIso8601String(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "cancelDate": cancelDate?.toIso8601String(),
        "sourceName": sourceName,
        "source": source.toJson(),
        "destinationName": destinationName,
        "destination": destination.toJson(),
        "estimatedDistance": estimatedDistance,
        "estimatedDuration": estimatedDuration,
        "estimatedPath": estimatedPath,
        "actualDistance": actualDistance,
        "actualDuration": actualDuration,
        "actualPath": actualPath,
        "preAcceptLatitud": preAcceptLat,
        "preAcceptLongitud": preAcceptLng,
        "preAcceptDistance": preAcceptDistance,
        "driverCompensation": driverCompensation,
        "preAcceptPath": preAcceptPath,
        "tripRate": tripRate,
        "reviewNote": reviewNote,
        "note": note,
        "tripType": tripType.index,
        "tripStatus": tripStatus.index,
        "estimatedCost": estimatedCost,
        "actualCost": actualCost,
        "isPaid": isPaid,
        "cancelReasone": cancelReasone,
        "carCategoryId": carCategoryId,
        "carCategory": carCategory.toJson(),
        "discountValue": discountValue,
        "couponCode": couponCode,
        "tripStoppingPoints": tripStoppingPoints.map((x) => x.toJson()).toList(),
        "tripStoppingRecords": tripStoppingRecords.map((x) => x.toJson()).toList(),
        "enrollmentId": enrollmentId,
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
    required this.emergencyPhone,
    required this.userType,
    required this.accountBalance,
  });

  final String userName;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String avatar;
  final String emergencyPhone;
  final String userType;
  final num accountBalance;

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      userName: json["userName"] ?? "",
      fullName: json["fullName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      avatar: json["avatar"] ?? "",
      emergencyPhone: json["emergencyPhone"] ?? "",
      userType: json["userType"] ?? "",
      accountBalance: json["accountBalance"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "fullName": fullName,
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
        "emergencyPhone": emergencyPhone,
        "userType": userType,
        "accountBalance": accountBalance,
      };
}

class Destination {
  Destination({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      latitude: json["latitude"] ?? 0,
      longitude: json["longitude"] ?? 0,
    );
  }

  factory Destination.fromLatLng(LatLng? latLng) {
    if (latLng == null) return Destination.fromJson({});
    return Destination(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };

  LatLng toLatLng() => LatLng(latitude, longitude);
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
    required this.isExaminated,
    required this.examination,
    required this.lastInternetConnection,
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
  final bool isExaminated;
  final String examination;
  final DateTime? lastInternetConnection;

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
      isExaminated: json["isExaminated"] ?? false,
      examination: json["examination"] ?? "",
      lastInternetConnection: DateTime.tryParse(json["lastInternetConnection"] ?? ""),
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
        "isExaminated": isExaminated,
        "examination": examination,
        "lastInternetConnection": lastInternetConnection?.toIso8601String(),
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

class TripStoppingPoint {
  TripStoppingPoint({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  LatLng get point => LatLng(lat, lng);

  factory TripStoppingPoint.fromJson(Map<String, dynamic> json) {
    return TripStoppingPoint(
      lat: json["lat"] ?? 0,
      lng: json["lng"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class TripStoppingRecord {
  TripStoppingRecord({
    required this.id,
    required this.timerStartedAt,
    required this.timerStartedAtLatitud,
    required this.timerStartedAtLongitud,
    required this.timerEndedAt,
    required this.timerEndedAtLatitud,
    required this.timerEndedAtLongitud,
    required this.tripId,
    required this.duration,
  });

  final int id;
  final DateTime? timerStartedAt;
  final num timerStartedAtLatitud;
  final num timerStartedAtLongitud;
  final DateTime? timerEndedAt;
  final num timerEndedAtLatitud;
  final num timerEndedAtLongitud;
  final num tripId;
  final num duration;

  factory TripStoppingRecord.fromJson(Map<String, dynamic> json) {
    return TripStoppingRecord(
      id: json["id"] ?? 0,
      timerStartedAt: DateTime.tryParse(json["timerStartedAt"] ?? ""),
      timerStartedAtLatitud: json["timerStartedAtLatitud"] ?? 0,
      timerStartedAtLongitud: json["timerStartedAtLongitud"] ?? 0,
      timerEndedAt: DateTime.tryParse(json["timerEndedAt"] ?? ""),
      timerEndedAtLatitud: json["timerEndedAtLatitud"] ?? 0,
      timerEndedAtLongitud: json["timerEndedAtLongitud"] ?? 0,
      tripId: json["tripId"] ?? 0,
      duration: json["duration"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "timerStartedAt": timerStartedAt?.toIso8601String(),
        "timerStartedAtLatitud": timerStartedAtLatitud,
        "timerStartedAtLongitud": timerStartedAtLongitud,
        "timerEndedAt": timerEndedAt?.toIso8601String(),
        "timerEndedAtLatitud": timerEndedAtLatitud,
        "timerEndedAtLongitud": timerEndedAtLongitud,
        "tripId": tripId,
        "duration": duration,
      };
}

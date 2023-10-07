import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      preAcceptPath: json["preAcceptPath"] ?? "",
      tripRate: json["tripRate"] ?? 0,
      reviewNote: json["reviewNote"] ?? "",
      note: json["note"] ?? "",
      tripType: TripType.values[json["tripType"] ?? 0],
      tripStatus: TripStatus.values[json["tripStatus"] ?? 0],
      estimatedCost: json["estimatedCost"] ?? 0,
      actualCost: json["actualCost"] ?? 0,
      isPaid: json["isPaid"] ?? false,
      cancelReasone: json["cancelReasone"] ?? "",
      carCategoryId: json["carCategoryId"] ?? 0,
      carCategory: CarCategory.fromJson(json["carCategory"] ?? {}),
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
      };
}

class CarCategory {
  CarCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.driverRatio,
    required this.nightKmOverCost,
    required this.dayKmOverCost,
    required this.sharedKmOverCost,
    required this.nightSharedKmOverCost,
    required this.sharedDriverRatio,
    required this.minimumDayPrice,
    required this.minimumNightPrice,
    required this.companyLoyaltyRatio,
    required this.sharedMinimumDistanceInMeters,
    required this.normalOilRatio,
    required this.normalGoldRatio,
    required this.normalTiresRatio,
    required this.sharedOilRatio,
    required this.sharedGoldRatio,
    required this.sharedTiresRatio,
    required this.priceVariant,
    required this.seatNumber,
  });

  final int id;
  final String name;
  final String imageUrl;
  final num price;
  final num driverRatio;
  final num nightKmOverCost;
  final num dayKmOverCost;
  final num sharedKmOverCost;
  final num nightSharedKmOverCost;
  final num sharedDriverRatio;
  final num minimumDayPrice;
  final num minimumNightPrice;
  final num companyLoyaltyRatio;
  final num sharedMinimumDistanceInMeters;
  final num normalOilRatio;
  final num normalGoldRatio;
  final num normalTiresRatio;
  final num sharedOilRatio;
  final num sharedGoldRatio;
  final num sharedTiresRatio;
  final num priceVariant;
  final num seatNumber;

  factory CarCategory.fromJson(Map<String, dynamic> json) {
    return CarCategory(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      price: json["price"] ?? 0,
      driverRatio: json["driverRatio"] ?? 0,
      nightKmOverCost: json["nightKMOverCost"] ?? 0,
      dayKmOverCost: json["dayKMOverCost"] ?? 0,
      sharedKmOverCost: json["sharedKMOverCost"] ?? 0,
      nightSharedKmOverCost: json["nightSharedKMOverCost"] ?? 0,
      sharedDriverRatio: json["sharedDriverRatio"] ?? 0,
      minimumDayPrice: json["minimumDayPrice"] ?? 0,
      minimumNightPrice: json["minimumNightPrice"] ?? 0,
      companyLoyaltyRatio: json["companyLoyaltyRatio"] ?? 0,
      sharedMinimumDistanceInMeters: json["sharedMinimumDistanceInMeters"] ?? 0,
      normalOilRatio: json["normalOilRatio"] ?? 0,
      normalGoldRatio: json["normalGoldRatio"] ?? 0,
      normalTiresRatio: json["normalTiresRatio"] ?? 0,
      sharedOilRatio: json["sharedOilRatio"] ?? 0,
      sharedGoldRatio: json["sharedGoldRatio"] ?? 0,
      sharedTiresRatio: json["sharedTiresRatio"] ?? 0,
      priceVariant: json["priceVariant"] ?? 0,
      seatNumber: json["seatNumber"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "driverRatio": driverRatio,
        "nightKMOverCost": nightKmOverCost,
        "dayKMOverCost": dayKmOverCost,
        "sharedKMOverCost": sharedKmOverCost,
        "nightSharedKMOverCost": nightSharedKmOverCost,
        "sharedDriverRatio": sharedDriverRatio,
        "minimumDayPrice": minimumDayPrice,
        "minimumNightPrice": minimumNightPrice,
        "companyLoyaltyRatio": companyLoyaltyRatio,
        "sharedMinimumDistanceInMeters": sharedMinimumDistanceInMeters,
        "normalOilRatio": normalOilRatio,
        "normalGoldRatio": normalGoldRatio,
        "normalTiresRatio": normalTiresRatio,
        "sharedOilRatio": sharedOilRatio,
        "sharedGoldRatio": sharedGoldRatio,
        "sharedTiresRatio": sharedTiresRatio,
        "priceVariant": priceVariant,
        "seatNumber": seatNumber,
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
  });

  final String userName;
  final String fullName;
  final String name;
  final String surname;
  final String phoneNumber;
  final String avatar;
  final String emergencyPhone;
  final String userType;

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
      carType: CarType.fromJson(json["carType"]??{}),
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

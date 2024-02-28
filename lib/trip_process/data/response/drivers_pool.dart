import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriversPoolResponse {
  DriversPoolResponse({
    required this.result,
  });

  final List<DriversPool> result;

  factory DriversPoolResponse.fromJson(Map<String, dynamic> json){
    return DriversPoolResponse(
      result: json["result"] == null ? [] : List<DriversPool>.from(json["result"]!.map((x) => DriversPool.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result.map((x) => x?.toJson()).toList(),
  };

}

class DriversPool {
  DriversPool({
    required this.driverId,
    required this.driverName,
    required this.imei,
    required this.requestDate,
    required this.driverLat,
    required this.driverLng,
    required this.engineRunning,
    required this.driverStatus,
    required this.id,
  });

  final int driverId;
  final String driverName;
  final String imei;
  final DateTime? requestDate;
  final double driverLat;
  final double driverLng;
  final bool engineRunning;
  final num driverStatus;
  final int id;

  LatLng get point=>LatLng(driverLat, driverLng);
  factory DriversPool.fromJson(Map<String, dynamic> json){
    return DriversPool(
      driverId: json["driverId"] ?? 0,
      driverName: json['driver']["fullName"] ?? "",
      imei: json['driver']["imei"] ?? "",
      requestDate: DateTime.tryParse(json["requestDate"] ?? ""),
      driverLat: json["driverLat"] ?? 0,
      driverLng: json["driverLng"] ?? 0,
      engineRunning: json["engineRunning"] ?? false,
      driverStatus: json["driverStatus"] ?? 0,
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "driverName": driverName,
    "imei": imei,
    "requestDate": requestDate?.toIso8601String(),
    "driverLat": driverLat,
    "driverLng": driverLng,
    "engineRunning": engineRunning,
    "driverStatus": driverStatus,
    "id": id,
  };

}

import 'package:qareeb_models/global.dart';

class DriversImei {
  DriversImei({
    required this.result,
  });

  final List<DriverImei> result;

  factory DriversImei.fromJson(Map<String, dynamic> json) {
    return DriversImei(
      result: json["result"] == null
          ? []
          : List<DriverImei>.from(json["result"]!.map((x) => DriverImei.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class DriverImei {
  DriverImei({
    required this.id,
    required this.imei,
    required this.name,
    required this.status,
  });

  final int id;
  final String imei;
  final String name;
  final DriverStatus status;

  factory DriverImei.fromJson(Map<String, dynamic> json) {
    return DriverImei(
      id: json["id"] ?? 0,
      imei: json["imei"] ?? "",
      name: json["name"] ?? "",
      status: DriverStatus.values[json["status"] ?? 0],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "imei": imei,
        "name": name,
        "status": status.index,
      };
}

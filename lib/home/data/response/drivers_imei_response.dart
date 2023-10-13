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
  });

  final int id;
  final String imei;

  factory DriverImei.fromJson(Map<String, dynamic> json) {
    return DriverImei(
      id: json["id"] ?? 0,
      imei: json["imei"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "imei": imei,
      };
}

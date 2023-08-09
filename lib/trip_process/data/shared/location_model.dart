
class LocationModel {
  LocationModel({
    required this.lng,
    required this.lat,
  });

  double lng;
  double lat;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lng: json["longitud"] ?? 0.0,
      lat: json["latitud"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {"longitud": lng, "latitud": lat};


}



class TripPoint {
  TripPoint({
    required this.id,
    required this.name,
    required this.arName,
    required this.lat,
    required this.lng,
    required this.tags,
  });

  final int id;
  final String name;
  final String tags;
  final String arName;
  final double lat;
  final double lng;


  factory TripPoint.fromJson(Map<String, dynamic> json) {
    return TripPoint(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      arName: json["arName"] ?? "",
      lat: json["latitude"] ?? 0,
      lng: json["langitude"] ?? 0,
      tags: json["tags"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "arName": arName,
    "latitude": lat,
    "langitude": lng,
    "tags": tags,
  };
}

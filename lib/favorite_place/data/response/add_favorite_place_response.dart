

class FavoritePlaceResponse {
  FavoritePlaceResponse({required this.result});

  final FavoritePlaceResult result;

  factory FavoritePlaceResponse.fromJson(Map<String, dynamic> json) {
    return FavoritePlaceResponse(
      result: json['result'] == null
          ? FavoritePlaceResult.fromJson({})
          : FavoritePlaceResult.fromJson(json['result']),
    );
  }

  Map<String, dynamic> toJson() => {'result': result.toJson()};
}

class FavoritePlaceResult {
  FavoritePlaceResult({
    required this.id,
    required this.name,
    required this.lng,
    required this.lat,
  });

  final int id;
  final String name;
  final double lng;
  final double lat;


  factory FavoritePlaceResult.fromRequest(dynamic request, int id) {
    return FavoritePlaceResult(
      id: id,
      name: request.name,
      lng: request.lng,
      lat: request.lat,
    );
  }

  factory FavoritePlaceResult.fromJson(Map<String, dynamic> json) {
    return FavoritePlaceResult(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      lng: json['longitud'] ?? 0,
      lat: json['latitud'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'longitud': lng,
        'latitud': lat,
      };
}

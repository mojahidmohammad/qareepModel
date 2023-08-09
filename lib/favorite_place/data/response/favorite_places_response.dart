import 'add_favorite_place_response.dart';

class FavoritePlacesResponse {
  FavoritePlacesResponse({
    required this.result,
  });

  final List<FavoritePlaceResult> result;

  factory FavoritePlacesResponse.fromJson(Map<String, dynamic> json) {
    return FavoritePlacesResponse(
      result: json['result'] == null
          ? []
          : List<FavoritePlaceResult>.from(
              json['result']!.map((x) => FavoritePlaceResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result.map((x) => x.toJson()).toList(),
      };
}

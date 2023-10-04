import '../../../global.dart';

class CheckTripInfoResponse {
  CheckTripInfoResponse({
    required this.result,
  });

  final CheckTripInfoResult? result;

  factory CheckTripInfoResponse.fromJson(Map<String, dynamic> json) {
    return CheckTripInfoResponse(
      result:
          json["result"] == null ? null : CheckTripInfoResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class CheckTripInfoResult {
  CheckTripInfoResult({
    required this.categories,
    required this.estimatedDistance,
    required this.estimatedDuration,
    required this.estimatedPath,
  });

  final List<Category> categories;
  final num estimatedDistance;
  final num estimatedDuration;
  final String estimatedPath;

  factory CheckTripInfoResult.fromJson(Map<String, dynamic> json) {
    return CheckTripInfoResult(
      categories: json["categories"] == null
          ? []
          : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      estimatedDistance: json["estimatedDistance"] ?? 0,
      estimatedDuration: json["estimatedDuration"] ?? 0,
      estimatedPath: json["estimatedPath"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "categories": categories.map((x) => x.toJson()).toList(),
        "estimatedDistance": estimatedDistance,
        "estimatedDuration": estimatedDuration,
        "estimatedPath": estimatedPath,
      };
}

class Category {
  Category({
    required this.carCategoryId,
    required this.name,
    required this.imageUrl,
    required this.seatsNumber,
    required this.price,
    this.isSelected = false,
  });

  final int carCategoryId;
  final String name;
  final String imageUrl;
  final num seatsNumber;
  final num price;
  bool isSelected;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      carCategoryId: json["carCategoryId"] ?? 0,
      name: json["name"] ?? "",
      imageUrl: FixUrl.fixAvatarImage(json["imageUrl"]),
      seatsNumber: json["seatsNumber"] ?? 0,
      price: json["price"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "carCategoryId": carCategoryId,
        "name": name,
        "imageUrl": imageUrl,
        "seatsNumber": seatsNumber,
        "price": price,
      };
}

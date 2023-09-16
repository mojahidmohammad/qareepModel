class EstimateResponse {
  EstimateResponse({
    required this.result,
  });

  final List<Estimate> result;

  factory EstimateResponse.fromJson(Map<String, dynamic> json) {
    return EstimateResponse(
      result: json["result"] == null
          ? []
          : List<Estimate>.from(json["result"]!.map((x) => Estimate.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class Estimate {
  Estimate({
    required this.carCategoryName,
    required this.carCategorySeats,
    required this.prices,
  });

  final String carCategoryName;
  final num carCategorySeats;
  final List<num> prices;

  factory Estimate.fromJson(Map<String, dynamic> json) {
    return Estimate(
      carCategoryName: json["carCategoryName"] ?? "",
      carCategorySeats: json["carCategorySeats"] ?? 0,
      prices: json["prices"] == null ? [] : List<num>.from(json["prices"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "carCategoryName": carCategoryName,
        "carCategorySeats": carCategorySeats,
        "prices": prices.map((x) => x).toList(),
      };
}

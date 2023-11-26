class EstimateCompanyResponse {
  EstimateCompanyResponse({
    required this.result,
  });

  final List<EstimateCompany> result;

  factory EstimateCompanyResponse.fromJson(Map<String, dynamic> json) {
    return EstimateCompanyResponse(
      result: json["result"] == null
          ? []
          : List<EstimateCompany>.from(json["result"]!.map((x) => EstimateCompany.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class EstimateCompany {
  EstimateCompany({
    required this.carCategoryName,
    required this.carCategorySeats,
    required this.price,
  });

  final String carCategoryName;
  final num carCategorySeats;
  final num price;

  factory EstimateCompany.fromJson(Map<String, dynamic> json) {
    return EstimateCompany(
      carCategoryName: json["carCategoryName"] ?? "",
      carCategorySeats: json["carCategorySeats"] ?? 0,
      price: json["price"]??0,
    );
  }

  Map<String, dynamic> toJson() => {
        "carCategoryName": carCategoryName,
        "carCategorySeats": carCategorySeats,
        "price": price,
      };
}

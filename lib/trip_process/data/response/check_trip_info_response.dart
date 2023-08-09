
import '../shared/cars_type.dart';
import '../shared/location_model.dart';

class CheckTripInfoResponse {
  CheckTripInfoResponse({
    required this.result,
  });

  final CheckTripInfoResult result;

  factory CheckTripInfoResponse.fromJson(Map<String, dynamic> json) {
    return CheckTripInfoResponse(
      result: CheckTripInfoResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {"result": result.toJson()};
}

class CheckTripInfoResult {
  CheckTripInfoResult({
    required this.carsTypes,
    required this.currentLocation,
    required this.destination,
  });

  final List<CarsType> carsTypes;
  final LocationModel currentLocation;
  final LocationModel destination;

  factory CheckTripInfoResult.fromJson(Map<String, dynamic> json) {
    return CheckTripInfoResult(
      carsTypes: json["carsTypes"] == null
          ? []
          : List<CarsType>.from(json["carsTypes"]!.map((x) => CarsType.fromJson(x))),
      currentLocation: LocationModel.fromJson(json["currentLocation"] ?? {}),
      destination: LocationModel.fromJson(json["distnation"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "carsTypes": carsTypes.map((x) => x.toJson()).toList(),
        "currentLocation": currentLocation.toJson(),
        "distnation": destination.toJson(),
      };
}

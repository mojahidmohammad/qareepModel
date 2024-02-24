import '../../../companies/data/response/companies_response.dart';
import '../../../global.dart';
import 'enrollments.dart';

class PlanResponse {
  PlanResponse({
    required this.result,
  });

  final PlanModel result;

  factory PlanResponse.fromJson(Map<String, dynamic> json) {
    return PlanResponse(
      result: PlanModel.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "result": result.toJson(),
      };
}

class PlansResponse {
  PlansResponse({
    required this.result,
  });

  final PlansResult result;

  factory PlansResponse.fromJson(Map<String, dynamic> json) {
    return PlansResponse(
      result: PlansResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "result": result.toJson(),
      };
}

class PlansResult {
  PlansResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<PlanModel> items;

  factory PlansResult.fromJson(Map<String, dynamic> json) {
    return PlansResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<PlanModel>.from(json["items"]!.map((x) => PlanModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "totalCount": totalCount,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class PlanModel {
  PlanModel({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.maxPathMeters,
    required this.maxDailyUsage,
    required this.maxMonthlyUsage,
    required this.activationDayNumber,
    required this.maxMeters,
    required this.isActive,
    required this.type,
    required this.enrollments,
  });

  final int id;
  final num price;
  final String name;
  final String description;
  final String imageUrl;
  final num maxPathMeters;
  final num maxDailyUsage;
  final num maxMonthlyUsage;
  final num activationDayNumber;
  final num maxMeters;
  final bool isActive;
  final PlanType type;
  final List<Enrollment> enrollments;

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json["id"] ?? 0,
      price: json["price"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      imageUrl: FixUrl.fixAvatarImage(json["imageUrl"] ?? ""),
      maxPathMeters: json["maxPathMeters"] ?? 0,
      maxDailyUsage: json["maxDailyUsage"] ?? 0,
      maxMonthlyUsage: json["maxMonthlyUsage"] ?? 0,
      activationDayNumber: json["activationDayNumber"] ?? 0,
      maxMeters: json["maxMeters"] ?? 0,
      isActive: json["isActive"] ?? false,
      type: PlanType.values[json["type"] ?? 0],
      enrollments: json["enrollments"] == null
          ? []
          : List<Enrollment>.from(
          json["enrollments"]!.map((x) => Enrollment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "price": price,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "maxPathMeters": maxPathMeters,
        "maxDailyUsage": maxDailyUsage,
        "maxMonthlyUsage": maxMonthlyUsage,
        "activationDayNumber": activationDayNumber,
        "maxMeters": maxMeters,
        "isActive": isActive,
        "type": type.index,
        "enrollments": enrollments.map((x) => x.toJson()).toList(),
      };
}

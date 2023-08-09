

import '../../../trip_path/data/models/trip_path.dart';

class TemplatesResponse {
  TemplatesResponse({
    required this.result,
  });

  final TemplatesResult result;

  factory TemplatesResponse.fromJson(Map<String, dynamic> json) {
    return TemplatesResponse(
      result: TemplatesResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class TemplatesResult {
  TemplatesResult({
    required this.totalCount,
    required this.items,
  });

  int totalCount;
  final List<TemplateModel> items;

  factory TemplatesResult.fromJson(Map<String, dynamic> json) {
    return TemplatesResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<TemplateModel>.from(
              json["items"]!.map((x) => TemplateModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class TemplateModel {
  TemplateModel({
    required this.id,
    required this.institutionId,
    required this.pathId,
    required this.path,
    required this.description,
    required this.distance,
  });

  final int id;
  final num institutionId;
  final num pathId;
  final TripPath path;
  final String description;
  final num distance;

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json["id"] ?? 0,
      institutionId: json["institutionId"] ?? 0,
      pathId: json["pathId"] ?? 0,
      path: TripPath.fromJson(json["path"] ?? {}),
      description: json["description"] ?? "",
      distance: json["distance"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "institutionId": institutionId,
        "pathId": pathId,
        "path": path.toJson(),
        "description": description,
        "distance": distance,
      };
}

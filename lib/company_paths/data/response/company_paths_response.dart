import '../../../trip_path/data/models/trip_path.dart';

class CompanyPathsResponse {
  CompanyPathsResponse({
    required this.result,
  });

  final CompanyPathsResult result;

  factory CompanyPathsResponse.fromJson(Map<String, dynamic> json) {
    return CompanyPathsResponse(
      result: CompanyPathsResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class CompanyPathsResult {
  CompanyPathsResult({
    required this.items,
    required this.totalCount,
  });

  final List<CompanyPath> items;
  final int totalCount;

  factory CompanyPathsResult.fromJson(Map<String, dynamic> json) {
    return CompanyPathsResult(
      items: json["items"] == null
          ? []
          : List<CompanyPath>.from(json["items"]!.map((x) => CompanyPath.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class CompanyPath {
  CompanyPath({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.pathId,
    required this.path,
    required this.description,
    required this.distance,
  });

  final int id;
  final int companyId;
  final String companyName;
  final num pathId;
  final TripPath path;
  final String description;
  final num distance;

  factory CompanyPath.fromJson(Map<String, dynamic> json) {
    return CompanyPath(
      id: json["id"] ?? 0,
      companyId: json["companyId"] ?? 0,
      companyName: json["companyName"] ?? '',
      pathId: json["pathId"] ?? 0,
      path: TripPath.fromJson(json["path"] ?? {}),
      description: json["description"] ?? "",
      distance: json["distance"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyId": companyId,
        "companyName": companyName,
        "pathId": pathId,
        "path": path.toJson(),
        "description": description,
        "distance": distance,
      };
}

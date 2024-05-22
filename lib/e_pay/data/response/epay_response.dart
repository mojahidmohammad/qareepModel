import '../../../global.dart';

class ProvidersResponse {
  ProvidersResponse({
    required this.items,
    required this.totalCount,
  });

  final List<Provider> items;
  final num totalCount;

  factory ProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ProvidersResponse(
      items: json["items"] == null
          ? []
          : List<Provider>.from(
          json["items"]!.map((x) => Provider.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "items": items.map((x) => x.toJson()).toList(),
        "totalCount": totalCount,
      };
}

class Provider {
  Provider({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.order,
    required this.isActive,
    required this.isWebView,
  });

  final int id;
  final String name;
  final String imageUrl;
  final num order;
  final bool isActive;
  final bool isWebView;

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      imageUrl: FixUrl.fixAvatarImage(json["imageUrl"]),
      order: json["order"] ?? 0,
      isActive: json["isActive"] ?? false,
      isWebView: json["isWebView"] ?? false,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "order": order,
        "isActive": isActive,
        "isWebView": isWebView,
      };
}

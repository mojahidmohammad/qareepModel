class CancelReasonResponse {
  CancelReasonResponse({required this.result});

  final CancelReasonResult result;

  factory CancelReasonResponse.fromJson(Map<String, dynamic> json) {
    return CancelReasonResponse(
      result: json['result'] == null
          ? CancelReasonResult.fromJson({})
          : CancelReasonResult.fromJson(json['result']),
    );
  }

  Map<String, dynamic> toJson() => {'result': result.toJson()};
}

class CancelReasonResult {
  CancelReasonResult({
    required this.items,
    required this.totalCount,
  });

  final List<CancelReasonItem> items;
  final int totalCount;

  factory CancelReasonResult.fromJson(Map<String, dynamic> json) {
    return CancelReasonResult(
      items: json['items'] == null
          ? []
          : List<CancelReasonItem>.from(
              json['items']!.map((x) => CancelReasonItem.fromJson(x))),
      totalCount: json['totalCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items.map((x) => x.toJson()).toList(),
        'totalCount': totalCount,
      };
}

class CancelReasonItem {
  CancelReasonItem({
    this.isSelected =false,
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
   bool isSelected;

  factory CancelReasonItem.fromJson(Map<String, dynamic> json) {
    return CancelReasonItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

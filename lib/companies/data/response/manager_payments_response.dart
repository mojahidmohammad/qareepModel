import '../../../plans/data/response/enrollments.dart';
import '../../../wallet/data/response/wallet_response.dart';

class ManagerPaymentResponse {
  ManagerPaymentResponse({
    required this.result,
  });

  final ManagerPaymentResult? result;

  factory ManagerPaymentResponse.fromJson(Map<String, dynamic> json) {
    return ManagerPaymentResponse(
      result:
          json["result"] == null ? null : ManagerPaymentResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class ManagerPaymentResult {
  ManagerPaymentResult({
    required this.enrollmentCharging,
    required this.transfers,
  });

  final List<EnrollmentCharging> enrollmentCharging;
  final List<Transaction> transfers;

  factory ManagerPaymentResult.fromJson(Map<String, dynamic> json) {
    return ManagerPaymentResult(
      enrollmentCharging: json["enrollmentCharging"] == null
          ? []
          : List<EnrollmentCharging>.from(
              json["enrollmentCharging"]!.map((x) => EnrollmentCharging.fromJson(x))),
      transfers: json["transfers"] == null
          ? []
          : List<Transaction>.from(
              json["transfers"]!.map((x) => Transaction.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "enrollmentCharging": enrollmentCharging.map((x) => x.toJson()).toList(),
        "transfers": transfers.map((x) => x.toJson()).toList(),
      };
}

class EnrollmentCharging {
  EnrollmentCharging({
    required this.id,
    required this.enrollment,
    required this.kiloMeters,
    required this.price,
    required this.date,
  });

  final int id;
  final Enrollment enrollment;
  final num kiloMeters;
  final num price;
  final DateTime? date;

  factory EnrollmentCharging.fromJson(Map<String, dynamic> json) {
    return EnrollmentCharging(
      id: json["id"] ?? 0,
      enrollment: Enrollment.fromJson(json["enrollment"] ?? {}),
      kiloMeters: json["kiloMeters"] ?? 0,
      price: json["price"] ?? 0,
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "enrollment": enrollment.toJson(),
        "kiloMeters": kiloMeters,
        "price": price,
        "date": date?.toIso8601String(),
      };
}

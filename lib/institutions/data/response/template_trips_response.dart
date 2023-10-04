
import '../../../global.dart';
import '../../../trip_path/data/models/trip_path.dart';
import 'institutions_response.dart';
import 'member_response.dart';

class TemplateTripsResponse {
  TemplateTripsResponse({
    required this.result,
  });

  final List<TemplateTrip> result;

  factory TemplateTripsResponse.fromJson(Map<String, dynamic> json) {
    return TemplateTripsResponse(
      result: json["result"] == null
          ? []
          : List<TemplateTrip>.from(
              json["result"]!.map((x) => TemplateTrip.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class TemplateTrip {
  TemplateTrip({
    required this.id,
    required this.name,
    required this.tripTemplateId,
    required this.institutionId,
    required this.pathId,
    required this.path,
    required this.description,
    required this.category,
    required this.distance,
    required this.buses,
    required this.creationDate,
    required this.startDate,
    required this.endDate,
    required this.busTripType,
    required this.days,
    required this.attendances,
  });

  final int id;
  final String name;
  final num tripTemplateId;
  final num institutionId;
  final num pathId;
  final TripPath path;
  final String description;
  final BusTripCategory category;
  final num distance;
  final List<BusModel> buses;
  final DateTime? creationDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final BusTripType busTripType;
  final List<int> days;
  final List<Attendance> attendances;

  factory TemplateTrip.fromJson(Map<String, dynamic> json) {
    return TemplateTrip(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      tripTemplateId: json["tripTemplateId"] ?? 0,
      institutionId: json["institutionId"] ?? 0,
      pathId: json["pathId"] ?? 0,
      path: TripPath.fromJson(json["path"] ?? {}),
      description: json["description"] ?? "",
      category: BusTripCategory.values[json["category"] ?? 0],
      distance: json["distance"] ?? 0,
      buses: json["buses"] == null
          ? []
          : List<BusModel>.from(json["buses"]!.map((x) => BusModel.fromJson(x))),
      creationDate: DateTime.tryParse(json["creationDate"] ?? ""),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      busTripType: BusTripType.values[json["busTripType"] ?? 0],
      days: json["days"] == null ? [] : List<int>.from(json["days"]!.map((x) => x)),
      attendances: json["attendances"] == null
          ? []
          : List<Attendance>.from(
              json["attendances"]!.map((x) => Attendance.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tripTemplateId": tripTemplateId,
        "institutionId": institutionId,
        "pathId": pathId,
        "path": path.toJson(),
        "description": description,
        "distance": distance,
        "buses": buses.map((x) => x.toJson()).toList(),
        "creationDate": creationDate?.toIso8601String(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "busTripType": busTripType.index,
        "days": days.map((x) => x).toList(),
        "attendances": attendances.map((x) => x.toJson()).toList(),
      };
}

class Attendance {
  Attendance({
    required this.id,
    required this.busTripId,
    required this.busMemberId,
    required this.busMember,
    required this.date,
    required this.attendanceType,
    required this.isParticipated,
  });

  final int id;
  final num busTripId;
  final num busMemberId;
  final Member busMember;
  final DateTime? date;
  final int attendanceType;
  final bool isParticipated;

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json["id"] ?? 0,
      busTripId: json["busTripId"] ?? 0,
      busMemberId: json["busMemberId"] ?? 0,
      busMember: Member.fromJson(json["busMember"] ?? {}),
      date: DateTime.tryParse(json["date"] ?? ""),
      attendanceType: json["attendanceType"] ?? 0,
      isParticipated: json["isParticipated"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "busTripId": busTripId,
        "busMemberId": busMemberId,
        "busMember": busMember.toJson(),
        "date": date?.toIso8601String(),
        "attendanceType": attendanceType,
        "isParticipated": isParticipated,
      };
}

class BusModel {
  BusModel({
    required this.id,
    required this.ime,
    required this.driverName,
    required this.driverPhone,
    required this.busModel,
    required this.busColor,
    required this.busNumber,
    required this.seatsNumber,
    required this.institutionId,
    required this.institution,
    required this.supervisors,
  });

  final int id;
  final String ime;
  final String driverName;
  final String driverPhone;
  final String busModel;
  final String busColor;
  final String busNumber;
  final num seatsNumber;
  final num institutionId;
  final InstitutionModel institution;
  final List<Supervisor> supervisors;

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json["id"] ?? 0,
      ime: json["ime"] ?? "",
      driverName: json["driverName"] ?? "",
      driverPhone: json["driverPhone"] ?? "",
      busModel: json["busModel"] ?? "",
      busColor: json["busColor"] ?? "",
      busNumber: json["busNumber"] ?? "",
      seatsNumber: json["seatsNumber"] ?? 0,
      institutionId: json["institutionId"] ?? 0,
      institution:  InstitutionModel.fromJson(json["institution"]??{}),
      supervisors: json["supervisors"] == null
          ? []
          : List<Supervisor>.from(
              json["supervisors"]!.map((x) => Supervisor.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "ime": ime,
        "driverName": driverName,
        "driverPhone": driverPhone,
        "busModel": busModel,
        "busColor": busColor,
        "busNumber": busNumber,
        "seatsNumber": seatsNumber,
        "institutionId": institutionId,
        "institution": institution.toJson(),
        "supervisors": supervisors.map((x) => x.toJson()).toList(),
      };
}

class Supervisor {
  Supervisor({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.userName,
    required this.password,
    required this.busId,
    required this.bus,
    required this.institutionId,
  });

  final int id;
  final String fullName;
  final String phone;
  final String userName;
  final String password;
  final num busId;
  final String bus;
  final num institutionId;

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json["id"] ?? 0,
      fullName: json["fullName"] ?? "",
      phone: json["phone"] ?? "",
      userName: json["userName"] ?? "",
      password: json["password"] ?? "",
      busId: json["busId"] ?? 0,
      bus: json["bus"] ?? "",
      institutionId: json["institutionId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phone": phone,
        "userName": userName,
        "password": password,
        "busId": busId,
        "bus": bus,
        "institutionId": institutionId,
      };
}

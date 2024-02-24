import 'package:qareeb_models/areas/data/response/area_response.dart';

import '../../../global.dart';
import '../../../governorates/data/response/governorate_response.dart';

class ProfileResponse {
  ProfileResponse({
    required this.result,
  });

  final ProfileResult result;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      result: ProfileResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class ProfileResult {
  ProfileResult({
    required this.password,
    required this.latitude,
    required this.longitude,
    required this.driverStatus,
    required this.isExamined,
    required this.companyId,
    required this.principalCompanyId,
    required this.id,
    required this.ageRange,
    required this.userName,
    required this.name,
    required this.surname,
    required this.emailAddress,
    required this.isActive,
    required this.address,
    required this.image,
    required this.avatar,
    required this.identity,
    required this.contract,
    required this.drivingLicence,
    required this.carMechanic,
    required this.birthdate,
    required this.gender,
    required this.fullName,
    required this.tripsCount,
    required this.favoritePlacesCount,
    required this.discountCouponValue,
    required this.fireBaseToken,
    required this.creationTime,
    required this.roleNames,
    required this.phoneNumber,
    required this.coupons,
    required this.imei,
    required this.emergencyPhone,
    required this.areas,
  });

  final num id;
  final String userName;
  final String name;
  final String surname;
  final String emailAddress;
  final bool isActive;
  final String address;
  final String image;
  late String avatar;
  final String identity;
  final String contract;
  final String drivingLicence;
  final String carMechanic;
  final DateTime? birthdate;
  final num gender;
  final String fullName;
  final num tripsCount;
  final num favoritePlacesCount;
  final num discountCouponValue;
  final String fireBaseToken;
  final String creationTime;
  final List<String> roleNames;
  final String phoneNumber;
  final String coupons;
  final String ageRange;
  final String imei;
  final String emergencyPhone;
  final List<AreaModel> areas;

  final String password;
  final num latitude;
  final num longitude;
  final DriverStatus driverStatus;
  final bool isExamined;
  final int companyId;
  final int principalCompanyId;

  factory ProfileResult.fromJson(Map<String, dynamic> json) {
    return ProfileResult(
      id: json["id"] ?? 0,
      userName: json["userName"] ?? "",
      ageRange: json["ageRange"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      emailAddress: json["emailAddress"] ?? "",
      isActive: json["isActive"] ?? false,
      address: json["address"] ?? "",
      image: json["image"] ?? "",
      avatar: FixUrl.fixAvatarImage(json["avatar"]),
      identity: json["identity"] ?? "",
      contract: json["contract"] ?? "",
      drivingLicence: json["drivingLicence"] ?? "",
      carMechanic: json["carMechanic"] ?? "",
      birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
      gender: json["gender"] ?? 0,
      fullName: json["fullName"] ?? "",
      tripsCount: json["tripsCount"] ?? 0,
      favoritePlacesCount: json["favoritePlacesCount"] ?? 0,
      discountCouponValue: json["discountCouponValue"] ?? 0,
      fireBaseToken: json["fireBaseToken"] ?? "",
      creationTime: json["creationTime"] ?? "",
      roleNames: json["roleNames"] == null
          ? []
          : List<String>.from(json["roleNames"]!.map((x) => x)),
      phoneNumber: json["phoneNumber"] ?? "",
      coupons: json["coupons"] ?? "",
      imei: json["imei"] ?? "",
      emergencyPhone: json["emergencyPhone"] ?? "",
      areas: json["areas"] == null
          ? []
          : List<AreaModel>.from(json["areas"]!.map((x) => AreaModel.fromJson(x))),
      password: json["password"] ?? "",
      latitude: json["latitude"] ?? 0,
      longitude: json["longitude"] ?? 0,
      driverStatus: DriverStatus.values[json["driverStatus"] ?? 0],
      isExamined: json["isExaminated"] ?? false,
      companyId: json["companyId"] ?? 0,
      principalCompanyId: json["principalCompanyId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "name": name,
        "surname": surname,
        "emailAddress": emailAddress,
        "isActive": isActive,
        "address": address,
        "image": image,
        "avatar": avatar,
        "ageRange": ageRange,
        "identity": identity,
        "contract": contract,
        "drivingLicence": drivingLicence,
        "carMechanic": carMechanic,
        "birthdate": birthdate?.toIso8601String(),
        "gender": gender,
        "fullName": fullName,
        "tripsCount": tripsCount,
        "favoritePlacesCount": favoritePlacesCount,
        "discountCouponValue": discountCouponValue,
        "fireBaseToken": fireBaseToken,
        "creationTime": creationTime,
        "roleNames": roleNames.map((x) => x).toList(),
        "phoneNumber": phoneNumber,
        "coupons": coupons,
        "imei": imei,
        "emergencyPhone": emergencyPhone,
        "password": password,
        "latitude": latitude,
        "longitude": longitude,
        "driverStatus": driverStatus.index,
        "isExamined": isExamined,
        "companyId": companyId,
        "principalCompanyId": principalCompanyId,

        "areas": areas.map((x) => x.toJson()).toList(),
      };
}

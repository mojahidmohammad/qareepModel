//
// class TripAcceptorResponse {
//   TripAcceptorResponse({required this.result});
//
//   final TripAcceptorResult result;
//
//   factory TripAcceptorResponse.fromJson(Map<String, dynamic> json) {
//     return TripAcceptorResponse(result: TripAcceptorResult.fromJson(json['result']));
//   }
//
//   Map<String, dynamic> toJson() => {'result': result.toJson()};
// }
//
// class TripAcceptorResult {
//   TripAcceptorResult({
//     required this.id,
//     required this.fullName,
//     required this.address,
//     required this.phoneNumber,
//     required this.carCategories,
//     required this.gender,
//     required this.currentLocation,
//     required this.carType,
//     required this.ime,
//   });
//
//   final int id;
//   final String fullName;
//   final String ime;
//   final String address;
//   final String phoneNumber;
//   final CarCategories carCategories;
//   final int gender;
//   final CurrentLocation currentLocation;
//   final CarType carType;
//
//   factory TripAcceptorResult.fromJson(Map<String, dynamic> json) {
//     return TripAcceptorResult(
//       id: json['id'] ?? 0,
//       fullName: json['fullName'] ?? '',
//       address: json['address'] ?? '',
//       ime: json['qarebDeviceimei'] ?? '',
//       phoneNumber: json['phoneNumber'] ?? '',
//       carCategories: CarCategories.fromJson(json['carCategories'] ?? {}),
//       gender: json['gender'] ?? 0,
//       currentLocation: CurrentLocation.fromJson(json['currentLocation'] ?? {}),
//       carType: CarType.fromJson(json['carType'] ?? {}),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'fullName': fullName,
//         'address': address,
//         'phoneNumber': phoneNumber,
//         'carCategories': carCategories.toJson(),
//         'gender': gender,
//         'currentLocation': currentLocation.toJson(),
//         'carType': carType.toJson(),
//       };
// }
//
// class CarCategories {
//   CarCategories({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.seatsNumber,
//     required this.price,
//     required this.driverRatio,
//     // required this.nightPeriodStart,
//     // required this.nightPeriodEnd,
//     // required this.minimumFareNight,
//     // required this.flagDownFeeNight,
//     // required this.priceMinNight,
//     // required this.priceKmNight,
//     // required this.minimumFareDay,
//     // required this.flagDownFeeDay,
//     // required this.priceMinDay,
//     // required this.priceKmDay,
//   });
//
//   final int id;
//   final String name;
//   final String imageUrl;
//   final num seatsNumber;
//   final num price;
//   final num driverRatio;
//
//   // final Map<String, num> nightPeriodStart;
//   // final Map<String, num> nightPeriodEnd;
//   // final num minimumFareNight;
//   // final num flagDownFeeNight;
//   // final num priceMinNight;
//   // final num priceKmNight;
//   // final num minimumFareDay;
//   // final num flagDownFeeDay;
//   // final num priceMinDay;
//   // final num priceKmDay;
//
//   factory CarCategories.fromJson(Map<String, dynamic> json) {
//     return CarCategories(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       imageUrl: json['imageUrl'] ?? '',
//       seatsNumber: json['seatsNumber'] ?? 0,
//       price: json['price'] ?? 0,
//       driverRatio: json['driverRatio'] ?? 0,
//       // nightPeriodStart: Map.from(json['nightPeriod_start'])
//       //     .map((k, v) => MapEntry<String, num>(k, v)),
//       // nightPeriodEnd: Map.from(json['nightPeriod_End'])
//       //     .map((k, v) => MapEntry<String, num>(k, v)),
//       // minimumFareNight: json['minimumFare_Night'] ?? 0,
//       // flagDownFeeNight: json['flag_downFee_Night'] ?? 0,
//       // priceMinNight: json['price_Min_Night'] ?? 0,
//       // priceKmNight: json['price_KM_Night'] ?? 0,
//       // minimumFareDay: json['minimumFare_DAY'] ?? 0,
//       // flagDownFeeDay: json['flag_downFee_DAY'] ?? 0,
//       // priceMinDay: json['price_Min_DAY'] ?? 0,
//       // priceKmDay: json['price_KM_DAY'] ?? 0,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'imageUrl': imageUrl,
//         'seatsNumber': seatsNumber,
//         'price': price,
//         'driverRatio': driverRatio,
//         // 'nightPeriod_start': Map.from(nightPeriodStart)
//         //     .map((k, v) => MapEntry<String, dynamic>(k, v)),
//         // 'nightPeriod_End': Map.from(nightPeriodEnd)
//         //     .map((k, v) => MapEntry<String, dynamic>(k, v)),
//         // 'minimumFare_Night': minimumFareNight,
//         // 'flag_downFee_Night': flagDownFeeNight,
//         // 'price_Min_Night': priceMinNight,
//         // 'price_KM_Night': priceKmNight,
//         // 'minimumFare_DAY': minimumFareDay,
//         // 'flag_downFee_DAY': flagDownFeeDay,
//         // 'price_Min_DAY': priceMinDay,
//         // 'price_KM_DAY': priceKmDay,
//       };
// }
//
// class CarType {
//   CarType({
//     required this.userId,
//     required this.carBrand,
//     required this.carModel,
//     required this.carColor,
//     required this.carNumber,
//   });
//
//   int userId;
//   String carBrand;
//   String carModel;
//   String carColor;
//   String carNumber;
//
//   factory CarType.fromJson(Map<String, dynamic> json) {
//     return CarType(
//       userId: json['userId'] ?? 0,
//       carBrand: json['carBrand'] ?? '',
//       carModel: json['carModel'] ?? '',
//       carColor: json['carColor'] ?? '',
//       carNumber: json['carNumber'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'userId': userId,
//         'carBrand': carBrand,
//         'carModel': carModel,
//         'carColor': carColor,
//         'carNumber': carNumber,
//       };
//
//   void setFromAcceptor(TripAcceptorResult acceptor) {
//     userId = acceptor.carType.userId;
//     carBrand = acceptor.carType.carBrand;
//     carModel = acceptor.carType.carModel;
//     carColor = acceptor.carType.carColor;
//     carNumber = acceptor.carType.carNumber;
//   }
// }
//
// class CurrentLocation {
//   CurrentLocation({
//     required this.clientId,
//     required this.lat,
//     required this.lng,
//     required this.speed,
//     required this.active,
//   });
//
//   final int clientId;
//   final double lat;
//   final double lng;
//   final String speed;
//   final String active;
//
//   factory CurrentLocation.fromJson(Map<String, dynamic> json) {
//     return CurrentLocation(
//       clientId: json['clientId'] ?? 0,
//       lng: json['longitud'] ?? 0,
//       lat: json['latitud'] ?? 0,
//       speed: json['speed'] ?? '',
//       active: json['active'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'clientId': clientId,
//         'longitud': lng,
//         'latitud': lat,
//         'speed': speed,
//         'active': active,
//       };
// }

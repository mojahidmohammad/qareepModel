import 'package:flutter/material.dart';

class FixUrl {
  static String fixAvatarImage(String? image) {
    if (image == null || image.isEmpty) return '';
    if (image.startsWith('http')) return image;
    final String link = "https://live.qareeb-maas.com/Images/$image";
    return link;
  }
}

class SpinnerItem {
  SpinnerItem({
    this.name,
    this.id = -2,
    this.isSelected = false,
    this.item,
    this.icon,
    this.enable = true,
  });

  String? name;
  int id;
  bool isSelected;
  bool enable;
  dynamic item;
  Widget? icon;

//<editor-fold desc="Data Methods">

  SpinnerItem copyWith({
    String? name,
    int? id,
    bool? isSelected,
    bool? enable,
    dynamic item,
  }) {
    return SpinnerItem(
      name: name ?? this.name,
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
      enable: enable ?? this.enable,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'isSelected': isSelected,
      'enable': enable,
      'item': item,
    };
  }

  factory SpinnerItem.fromMap(Map<String, dynamic> map) {
    return SpinnerItem(
      name: map['name'] as String,
      id: map['id'] as int,
      isSelected: map['isSelected'] as bool,
      enable: map['enable'] as bool,
      item: map['item'] as dynamic,
    );
  }

//</editor-fold>
}

enum CubitStatuses { init, done, loading, error }

enum TripStatus { non, reject, accept, start, end }

enum BookingPages { selectLocation, trip, booking }

enum StateScreen { non, confirmCode, policy, main, passwordCode }

enum NavTrip { waiting, acceptor, start, end, have }


enum MapType { normal, word, mix }

enum MtnState { init, pay, otp }

enum EpayProvider { fatora, mtn }

enum MyMarkerType { location, driver, point, sharedPint, bus }

enum SharedTripStatus { pending, started, closed, canceled }

enum SharedRequestStatus { pending, accepted, payed, pickedup, dropped, closed }

enum TransferStatus { pending, closed }

enum TransferPayType { driverToCompany, companyToDriver }

enum Government { damascus, rifDimashq }

enum BusTripType { go, back }

enum UserType { client, driver, admin, institutionAdmin }

enum WeekDays { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

enum InstitutionType { school, college, transportation }

enum MemberSubscriptionState { notSubscribe, active, expired }

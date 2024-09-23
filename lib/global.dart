import 'package:flutter/material.dart';

class FixUrl {
  static String fixAvatarImage(String? image) {
    if (image == null || image.isEmpty) return '';
    if (image.startsWith('http')) return image;
    final String link = "https://$qareebModelsBaseUrl/Images/$image";
    return link;
  }
}

String qareebModelsBaseUrl = 'live.qareeb-maas.com';

class SpinnerItem {
  SpinnerItem({
    this.name,
    this.id,
    this.isSelected = false,
    this.item,
    this.icon,
    this.enable = true,
  });

  String? name;
  int? id;
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

enum BookingPages { selectLocation, trip, booking }

enum StateScreen { non, confirmCode, policy, main, passwordCode }

enum NavTrip { waiting, acceptor, start, end }

enum MyMapType { normal, word, mix }

enum MtnState { init, pay, otp }

enum EpayProvider { fatora, mtn }

enum MyMarkerType { location, driver, point, sharedPint, bus }

enum SharedTripStatus { pending, started, closed, canceled }

enum SharedRequestStatus { pending, accepted, payed, pickedup, dropped, closed }

enum TransferStatus { pending, closed }

enum TransferPayType { driverToCompany, companyToDriver }

enum BusTripType { go, back }

enum UserType { client, driver, admin, institutionAdmin, agencyAdmin }

enum WeekDays { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

enum InstitutionType { school, college, transportation }

enum MemberSubscriptionState { notSubscribe, active, expired }

enum Gender { mail, female }

//
enum RedeemType { gold, oil, tire, gas }

enum BusTripCategory { qareebPoints, customPoints }

enum SyrianReportType { normalTrips, sharedtrips, planTrips }

enum TransferType {
  //دفع لرحلة تشاركية
  sharedPay,
  //دفع لرحلة عادي
  tripPay,
  //السائق دافع للشركة
  payoff,
  //الشركة دافعة للسائق
  debit,
  //جائزة
  award,
  //خصم
  discount,
  //استعادة
  refund,
  //خطة اشتراك
  planEnrollment,
  //محاسب وكيل
  agencyPayOff,
  //محاسبة الهيئة
  syrianAgency,
  //شحن تعويضي
  rePay,
  //
  enrollmentExtraMeters,
  //
  upgradeEnrollment,
  //دفع مباشر
  directPay,
}

enum SummaryPayToEnum {
  ///السائق يجب أن يدفع للشركة
  requiredFromDriver,

  ///الشركة يجب انت تدفع للسائق
  requiredFromCompany,

  ///الرصيد متكافئ
  equal,

  ///تحويل للوكيل
  agency,
}

enum TripType { scheduled, normal, goAndBack, delivery }

enum CarCategoryType { trips, delivery }

enum TripStatus {
  pending,
  accepted,
  started,
  completed,
  canceled,
  canceledByAdmin,
  pendingManager,
  canceledByManager;

  bool get isTripActive =>
      this == TripStatus.started || this == TripStatus.accepted;

  bool get isCanceled =>
      this == TripStatus.canceled ||
          this == TripStatus.canceledByAdmin ||
          this == TripStatus.canceledByManager;
  
  bool get isDelved => this == TripStatus.completed;

}

enum Governorate {
  damascus,
  ruralDamascus,
  aleppo,
  homs,
  hama,
  latakia,
  tartus,
  raqqa,
  alHasakah,
  idlib,
  deirEzZor,
  asSuwayda,
  daraa,
  quneitra,
}

enum CompanyType { plans }

enum PlanTripStatus { pending, running }

enum AttendanceType { up, down, unknown }

enum PlanType { companies, qareep, individual }

enum DriverStatus { unAvailable, available, busy }

enum NotificationType { trip, haveTrip, sharedTrip, driverStatus, other }

enum DeptType { tripPayment, driverCompensation,planTripPayment }

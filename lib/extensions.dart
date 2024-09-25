import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qareeb_models/points/data/model/trip_point.dart';
import 'package:qareeb_models/redeems/data/response/redeems_response.dart';
import 'package:qareeb_models/shared_trip/data/response/shared_trip.dart';
import 'package:qareeb_models/trip_path/data/models/trip_path.dart';
import 'package:qareeb_models/trip_process/data/response/trip_response.dart';
import 'package:qareeb_models/wallet/data/response/debt_response.dart';
import 'package:qareeb_models/wallet/data/response/driver_financial_response.dart';
import 'package:qareeb_models/wallet/data/response/single_driver_financial.dart';

import 'agencies/data/response/agencies_financial_response.dart';
import 'favorite_place/data/response/add_favorite_place_response.dart';
import 'global.dart';

extension Redeems on RedeemsResult {
  /// كم مرة يحق للسائق التبديل
  double get _oilCount =>
      ((km / systemParameters.oil) - (totals.oil / systemParameters.oil));

  /// كم مرة يحق للسائق التبديل
  double get _goldCount =>
      ((km / systemParameters.gold) - (totals.gold / systemParameters.gold));

  /// كم مرة يحق للسائق التبديل
  double get _tiresCount =>
      ((km / systemParameters.tire) - (totals.tire / systemParameters.tire));

  /// كم مرة يحق للسائق التبديل
  double get _gasCount =>
      ((km / systemParameters.gas) - (totals.gas / systemParameters.gas));

  // كم مرة يحق لكن عدد صحيح
  int get oilCount => (_oilCount).floor();

  int get goldCount => (_goldCount).floor();

  int get tiresCount => (_tiresCount).floor();

  int get gasCount => (_gasCount).floor();

  // كم مرة قام بالتبديل
  int get oilOldCount => (totals.oil / systemParameters.oil).floor();

  int get goldOldCount => (totals.gold / systemParameters.gold).floor();

  int get tiresOldCount => (totals.tire / systemParameters.tire).floor();

  int get gasOldCount => (totals.gas / systemParameters.gas).floor();

  double get oilPCount => double.parse((_oilCount * 100).toStringAsFixed(2));

  double get goldPCount => double.parse((_goldCount * 100).toStringAsFixed(2));

  double get tiresPCount => double.parse((_tiresCount * 100).toStringAsFixed(2));

  double get gasPCount => double.parse((_gasCount * 100).toStringAsFixed(2));
}

extension PolylineExt on List<List<num>> {
  List<LatLng> unpackPolyline() =>
      map((p) => LatLng(p[0].toDouble(), p[1].toDouble())).toList();
}

extension SplitByLength on String {
  List<String> splitByLength1(int length, {bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      var piece = substring(i, offset >= this.length ? this.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }

  bool get canSendToSearch {
    if (isEmpty) false;

    return split(' ').last.length > 2;
  }

  String get formatPrice => oCcy.format(this);

  String get removeSpace => replaceAll(' ', '');

  int get numberOnly {
    try {
      return int.parse(this);
    } on Exception {
      return 0;
    }
  }

  double get getCost {
    RegExp regExp = RegExp(r"(\d+\.\d+)");
    String? match = regExp.stringMatch(this);
    double number = double.parse(match ?? '0');
    return number;
  }

  String get removeDuplicates {
    List<String> words = split(' ');
    Set<String> uniqueWords = Set<String>.from(words);
    List<String> uniqueList = uniqueWords.toList();
    String output = uniqueList.join(' ');
    return output;
  }
}

final oCcy = NumberFormat("#,###", "en_US");

extension MaxInt on num {
  int get maxInt => 2147483647;

  String get formatPrice => oCcy.format(this);

  int get myRound {
    if (toInt() < this) return toInt() + 1;
    return toInt();
  }

  num getPercentage(num p) => this * p / 100;

  String get fixDistance => (this / 1000).toStringAsFixed(2);
}

extension NumHelper on num? {
  bool get isEmpty => this == null || this == 0;
}

extension SummaryPayToHelper on SummaryPayToEnum {
  ///السائق يجب أن يدفع للشركة
  bool get d2c => this == SummaryPayToEnum.requiredFromDriver;

  ///الشركة يجب انت تدفع للسائق
  bool get c2d =>
      this == SummaryPayToEnum.requiredFromCompany || this == SummaryPayToEnum.agency;

  ///الرصيد متكافئ
  bool get eq => this == SummaryPayToEnum.equal;

  bool get ag => this == SummaryPayToEnum.agency;
}

extension FinancialResultHelper on FinancialResult {
  DriverFinancialResult get driverFinancial => DriverFinancialResult.fromJson(toJson());

  String get getMessage {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return 'يستوجب على السائق تسديد مبلغ للشركة وقدره   ';

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return 'يستوجب على الشركة تسديد مبلغ للسائق وقدره  ';

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 'ان مستحقات الشركة من السائق مساوية تماما لمستحقات السائق لدى الشركة';

      //وكيل
      case SummaryPayToEnum.agency:
        return 'يستوجب على الشركة تسديد مبلغ للوكيل وقدره  ';
    }
  }

  num get price {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return requiredAmountFromDriver - requiredAmountFromCompany;

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return requiredAmountFromCompany - requiredAmountFromDriver;

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 0;

      //وكيل
      case SummaryPayToEnum.agency:
        return 0;
    }
  }

  SummaryPayToEnum get summaryType {
    if (requiredAmountFromCompany > requiredAmountFromDriver) {
      return SummaryPayToEnum.requiredFromCompany;
    } else if (requiredAmountFromDriver > requiredAmountFromCompany) {
      return SummaryPayToEnum.requiredFromDriver;
    } else {
      return SummaryPayToEnum.equal;
    }
  }
}

extension AgencyReportHelper on AgencyReport {
  String get getMessage => 'يستوجب على الشركة تسديد مبلغ للوكيل وقدره  ';

  num get price => requiredAmountFromCompany;

  SummaryPayToEnum get summaryType => SummaryPayToEnum.agency;
}

extension DriverFinancialHelper on DriverFinancialResult {
  String get getMessage {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return 'يستوجب على السائق تسديد مبلغ للشركة وقدره   ';

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return 'يستوجب على الشركة تسديد مبلغ للسائق وقدره  ';

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 'ان مستحقات الشركة من السائق مساوية تماما لمستحقات السائق لدى الشركة';
      //وكيل
      case SummaryPayToEnum.agency:
        return 'يستوجب على الشركة تسديد مبلغ للوكيل وقدره  ';
    }
  }

  num get price {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return requiredAmountFromDriver - requiredAmountFromCompany;

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return requiredAmountFromCompany - requiredAmountFromDriver;

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 0;
      //الرصيد متكافئ
      case SummaryPayToEnum.agency:
        return 0;
    }
  }

  SummaryPayToEnum get summaryType {
    if (requiredAmountFromCompany > requiredAmountFromDriver) {
      return SummaryPayToEnum.requiredFromCompany;
    } else if (requiredAmountFromDriver > requiredAmountFromCompany) {
      return SummaryPayToEnum.requiredFromDriver;
    } else {
      return SummaryPayToEnum.equal;
    }
  }
}

extension FinancialReportResultHelper on FinancialReportResult {
  String get getMessage {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return 'المبلغ المستحق على جميع السائقين';

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return 'المبلغ المستحق من الشركة لجميع السائقين';

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 'ان مستحقات الشركة من السائق مساوية تماما لمستحقات السائقين';
      //وكيل
      case SummaryPayToEnum.agency:
        return 'يستوجب على الشركة تسديد مبلغ للوكيل وقدره  ';
    }
  }

  num get price {
    switch (summaryType) {
      //السائق يجب أن يدفع للشركة
      case SummaryPayToEnum.requiredFromDriver:
        return totalRequiredAmountFromDriver - totalRequiredAmountFromCompany;

      //الشركة يجب انت تدفع للسائق
      case SummaryPayToEnum.requiredFromCompany:
        return totalRequiredAmountFromCompany - totalRequiredAmountFromDriver;

      //الرصيد متكافئ
      case SummaryPayToEnum.equal:
        return 0;
      //الرصيد متكافئ
      case SummaryPayToEnum.agency:
        return 0;
    }
  }

  SummaryPayToEnum get summaryType {
    if (totalRequiredAmountFromCompany > totalRequiredAmountFromDriver) {
      return SummaryPayToEnum.requiredFromCompany;
    } else if (totalRequiredAmountFromDriver > totalRequiredAmountFromCompany) {
      return SummaryPayToEnum.requiredFromDriver;
    } else {
      return SummaryPayToEnum.equal;
    }
  }
}

extension EnumSpinner on List<Enum> {
  List<SpinnerItem> spinnerItems({Enum? selected}) {
    return map((e) => SpinnerItem(
        name: e.arabicName, id: e.index, item: e, isSelected: e == selected)).toList();
  }

  List<SpinnerItem> spinnerItemsList({List<Enum?>? selected}) {
    return map(
      (e) => SpinnerItem(
        name: (e.arabicName.isEmpty) ? e.name : e.arabicName,
        id: e.index,
        item: e,
        isSelected: selected?.contains(e) ?? false,
      ),
    ).toList();
  }
}

extension ListHelper on List {
  List<List<dynamic>> groupingList(int size) {
    final List<List<dynamic>> result = [];
    for (int i = 0; i < length; i += size) {
      result.add(sublist(i, i + size > length ? length : i + size));
    }
    return result;
  }
}

extension StateName on SharedTripStatus {
  String sharedTripName() {
    switch (this) {
      case SharedTripStatus.pending:
        return 'ابدأ الرحلة';

      case SharedTripStatus.started:
        return 'إنهاء الرحلة';

      case SharedTripStatus.closed:
        return '(رجوع)تم إنهاء الرحلة';

      case SharedTripStatus.canceled:
        return 'الرحلة ملغية';
    }
  }
}

extension NavTripHelper on NavTrip {
  double get maxBottomSheet {
    switch (this) {
      case NavTrip.waiting:
        return 0.1;

      case NavTrip.acceptor:
        return 0.4;

      case NavTrip.start:
        return 0.24;

      case NavTrip.end:
        break;
    }
    return 0.5;
  }

  double get minBottomSheet {
    switch (this) {
      case NavTrip.waiting:
        return 0.1;

      case NavTrip.acceptor:
        return 0.2;

      case NavTrip.start:
        return 0.1;

      case NavTrip.end:
        break;
    }
    return 0.2;
  }

  double get initBottomSheet {
    switch (this) {
      case NavTrip.waiting:
        return 0.1;
      case NavTrip.acceptor:
        return 0.2;
      case NavTrip.start:
        return 0.1;
      case NavTrip.end:
        break;
    }
    return 0.3;
  }
}

extension TripTypeHelper on TripType {
  ///الشركة يجب انت تدفع للسائق
  bool get isDeliver => this == TripType.delivery;
}

extension PathMap on TripPath {
  List<LatLng> getPoints() {
    final list = <LatLng>[];

    edges.forEachIndexed((i, e) {
      if (i == 0) {
        list.add(e.startPoint.getLatLng);
      }
      list.add(e.endPoint.getLatLng);
    });

    return list;
  }

  List<String> get getPointsName {
    final list = <String>[];

    edges.forEachIndexed((i, e) {
      if (i == 0) {
        list.add(e.startPoint.arName);
      }
      list.add(e.endPoint.arName);
    });

    return list;
  }

  List<TripPoint> get getTripPoints {
    final list = <TripPoint>[];

    edges.forEachIndexed((i, e) {
      if (i == 0) {
        list.add(e.startPoint);
      }
      list.add(e.endPoint);
    });

    return list;
  }

  LatLng? get startPoint => edges.firstOrNull?.startPoint.getLatLng;

  List<SpinnerItem> get getPointsSpinner {
    final list = <SpinnerItem>[];

    edges.forEachIndexed((i, e) {
      if (i == 0) {
        list.add(SpinnerItem(
          id: e.startPoint.id,
          name: e.startPoint.arName,
          item: e,
        ));
      }
      list.add(SpinnerItem(
        id: e.endPoint.id,
        name: e.endPoint.arName,
        item: e,
      ));
    });

    return list;
  }
}

extension NormalTripMap on Trip {
  LatLng get startPoint => LatLng(source.latitude, source.longitude);

  LatLng get endPoint => LatLng(destination.latitude, destination.longitude);

  LatLng? get preAcceptPoint =>
      (preAcceptLat == 0) ? null : LatLng(preAcceptLat, preAcceptLng);

  NavTrip? get tripStateEnum {
    switch (tripStatus) {
      case TripStatus.pending:
        return NavTrip.waiting;
      case TripStatus.accepted:
        return NavTrip.acceptor;
      case TripStatus.started:
        return NavTrip.start;
      case TripStatus.completed:
        return NavTrip.end;
      case TripStatus.canceled:
        return null;
      case TripStatus.canceledByAdmin:
        return null;
      case TripStatus.pendingManager:
        return null;
      case TripStatus.canceledByManager:
        return null;
    }
  }

  bool get isCompanyTrip => enrollmentId != 0;
}

extension SharedRequestMap on SharedTrip {
  int nou(LatLng point) {
    for (var e in sharedRequests) {
      if (e.status == SharedRequestStatus.pending) return 0;
      if (e.pickupPoint.getLatLng.hashCode == point.hashCode) return e.seatNumber;
    }
    return 0;
  }

  bool get isStart => startDate != null;

  bool get isEnd => endDate != null||tripStatus == SharedTripStatus.closed;

  String get getStringStatus {
    if (isEnd) {
      return 'منتهية';
    }
    if (isStart) {
      return 'بدأت';
    }
    if (tripStatus == SharedTripStatus.canceled) return 'ملغية';

    return '';
  }

  Color get getColorStatus {
    if (isStart) {
      return Colors.green;
    }
    if (isEnd) {
      return Colors.grey;
    }

    if (tripStatus == SharedTripStatus.canceled) return Colors.red;

    return Colors.transparent;
  }

  String get dateTrip {
    if (isStart) {
      return startDate?.formatFullDate??'';
    } else if (isEnd) {
      return 'منتهية:  ${endDate?.formatFullDate??''}';
    }
    return schedulingDate?.formatFullDate ?? '';
  }

  List<SpinnerItem> availableRequest() {
    var s = <SpinnerItem>[];
    var a = seatNumber - sharedRequests.length;
    for (var i = 1; i <= a; i++) {
      s.add(SpinnerItem(id: i, name: i.toString()));
    }
    return s;
  }
}

extension TripPointHelper on TripPoint {
  LatLng get getLatLng => LatLng(lat, lng);
}

extension FirstItem<E> on Iterable<E> {
  E? firstItem() {
    if (isEmpty) {
      return null;
    } else {
      return first;
    }
  }

  E? lastItem() {
    if (isEmpty) {
      return null;
    } else {
      return last;
    }
  }
}

extension GetDateTimesBetween on DateTime {
  List<DateTime> getDateTimesBetween({
    required DateTime end,
    required Duration period,
  }) {
    var dateTimes = <DateTime>[];
    var current = add(period);
    while (current.isBefore(end)) {
      if (dateTimes.length > 24) {
        break;
      }
      dateTimes.add(current);
      current = current.add(period);
    }
    return dateTimes;
  }
}

extension DateUtcHelper on DateTime {
  int get hashDate => (day * 61) + (month * 83) + (year * 23);

  DateTime get getUtc => DateTime.utc(year, month, day);

  String get formatDate => DateFormat('yyyy/MM/dd').format(this);

  String get formatTime {
    var t = DateFormat('h:mm a').format(this);

    return t.replaceAll('PM', 'م').replaceAll('AM', 'ص');
  }

  String get formatDateTime => '$formatDate $formatTime';

  String get formatFullDate => '$formatDayName  $formatDate  $formatTime';

  String get formatDayName {
    initializeDateFormatting();
    return DateFormat('EEEE', 'ar_SA').format(this);
  }

  DateTime addFromNow({int? year, int? month, int? day}) {
    return DateTime(
        this.year + (year ?? 0), this.month + (month ?? 0), this.day + (day ?? 0));
  }

  DateTime initialFromDateTime({required DateTime date, required TimeOfDay time}) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  String get formatDateAther => DateFormat('yyyy/MM/dd HH:MM').format(this);

  FormatDateTime getFormat({DateTime? serverDate}) {
    final difference = this.difference(serverDate ?? DateTime.now());

    final months = difference.inDays.abs() ~/ 30;
    final days = difference.inDays.abs() % 360;
    final hours = difference.inHours.abs() % 24;
    final minutes = difference.inMinutes.abs() % 60;
    final seconds = difference.inSeconds.abs() % 60;
    return FormatDateTime(
      months: months,
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  String formatDuration({DateTime? serverDate}) {
    final difference = this.difference(serverDate ?? DateTime.now());

    final months = difference.inDays.abs() ~/ 30;
    final days = difference.inDays.abs() % 30;
    final hours = difference.inHours.abs() % 24;
    final minutes = difference.inMinutes.abs() % 60;
    final seconds = difference.inSeconds.abs() % 60;

    final formattedDuration = StringBuffer();
    formattedDuration.write('منذ: ');
    var c = 0;
    if (months > 0) {
      c++;
      formattedDuration.write('و $months شهر ');
    }
    if (days > 0 && c < 2) {
      c++;
      formattedDuration.write('و $days يوم  ');
    }
    if (hours > 0 && c < 2) {
      c++;
      formattedDuration.write('و $hours ساعة  ');
    }
    if (minutes > 0 && c < 2) {
      c++;
      formattedDuration.write('و $minutes دقيقة  ');
    }
    if (seconds > 0 && c < 2) {
      c++;
      formattedDuration.write('و $seconds ثانية ');
    }

    return formattedDuration.toString().trim().replaceFirst('و', '');
  }
}

extension DateUtcHelperNulable on DateTime? {
  int getMinDifference(DateTime? date) =>
      date == null ? 0 : (this?.difference(date).abs())?.inMinutes.round() ?? 0;
}

extension DebtH on Debt {
  String get typeName {
    switch (type) {
      case DeptType.tripPayment:
        return sharedRequestId != 0 ? ' مقعد برحلة تشاركية' : ' عادية ';
      case DeptType.driverCompensation:
        return 'مسافة تعويضية';
      case DeptType.planTripPayment:
        return 'رحلة اشتراكات';
    }
  }
}

extension ScrollMax on ScrollController {
  bool get isMax => position.maxScrollExtent == offset;

  bool get isMin => offset == 0;
}

extension FavoritePlaceResultHelper on FavoritePlaceResult {
  LatLng get latLng => LatLng(lat, lng);
}

extension RealName on Enum {
  String get upperFirst => name.replaceRange(0, 1, name.substring(0, 1).toUpperCase());

  String get arabicName {
    if (this is WeekDays) {
      switch (this) {
        case WeekDays.sunday:
          return 'أحد';
        case WeekDays.monday:
          return 'إثنين';
        case WeekDays.tuesday:
          return 'ثلاثاء';
        case WeekDays.wednesday:
          return 'أربعاء';
        case WeekDays.thursday:
          return 'خميس';
        case WeekDays.friday:
          return 'جمعة';
        case WeekDays.saturday:
          return 'سبت';
      }
    }

    if (this is NavTrip) {
      switch (this) {
        case NavTrip.waiting:
          return 'جاري البحث عن سائق';
        case NavTrip.acceptor:
          return 'جارية';
        case NavTrip.start:
          return 'بدأت بالفعل';
        case NavTrip.end:
          return 'منتهية';
      }
    }

    if (this is SyrianReportType) {
      switch (this) {
        case SyrianReportType.normalTrips:
          return 'رحلة عادية';
        case SyrianReportType.sharedtrips:
          return 'رحلة تشاركية';
        case SyrianReportType.planTrips:
          return 'رحلة اشتراكات';
      }
    }

    if (this is MemberSubscriptionState) {
      switch (this) {
        case MemberSubscriptionState.notSubscribe:
          return 'غير مشترك';
        case MemberSubscriptionState.active:
          return 'الاشتراك فعال';
        case MemberSubscriptionState.expired:
          return 'اشتراك منتهي الصلاحية';
      }
    }

    if (this is Gender) {
      switch (this) {
        case Gender.mail:
          return 'ذكر';
        case Gender.female:
          return 'أنثى';
      }
    }

    if (this is RedeemType) {
      switch (this) {
        case RedeemType.gold:
          return 'المليون';
        case RedeemType.oil:
          return 'زيت';
        case RedeemType.tire:
          return 'إطارات';
        case RedeemType.gas:
          return 'بنزين';
      }
    }

    if (this is TransferType) {
      switch (this) {
        case TransferType.sharedPay:
          return 'تحويل لرحلة تشاركية';
        case TransferType.tripPay:
          return 'تحويل لرحلة عادية';
        case TransferType.payoff:
          return 'دفعة من السائق للشركة';
        case TransferType.debit:
          return 'دفعة من الشركة للسائق';
        case TransferType.award:
          return 'مكافئة';
        case TransferType.discount:
          return 'قسيمة حسم';
        case TransferType.refund:
          return 'استرجاع';
        case TransferType.planEnrollment:
          return 'اشتراك بخطة';
        case TransferType.agencyPayOff:
          return 'دفعة للوكيل';
        case TransferType.syrianAgency:
          return 'دفعة للهيئة';
        case TransferType.rePay:
          return 'دفعة تعويضية';
        case TransferType.enrollmentExtraMeters:
          return 'بطاقة شحن كيلومترات';
        case TransferType.upgradeEnrollment:
          return 'تجديد خطة';
        case TransferType.directPay:
          return 'دفع مباشر';
      }
    }

    if (this is SummaryPayToEnum) {
      switch (this) {
        case SummaryPayToEnum.requiredFromDriver:
          return 'السائق يجب أن يدفع للشركة';
        case SummaryPayToEnum.requiredFromCompany:
          return 'الشركة يجب انت تدفع للسائق';
        case SummaryPayToEnum.equal:
          return 'الرصيد متكافئ';
      }
    }

    if (this is UserType) {
      switch (this) {
        case UserType.client:
          return 'زبون';
        case UserType.driver:
          return 'سائق';
        case UserType.admin:
          return 'مدير نظام';
        case UserType.institutionAdmin:
          return 'مدير مؤسسة';
        case UserType.agencyAdmin:
          return 'وكيل';
      }
    }

    if (this is InstitutionType) {
      switch (this) {
        case InstitutionType.school:
          return 'مدرسة';
        case InstitutionType.college:
          return 'جامعة';
        case InstitutionType.transportation:
          return 'نقل';
      }
    }

    if (this is BusTripType) {
      switch (this) {
        case BusTripType.go:
          return 'ذهاب';
        case BusTripType.back:
          return 'إياب';
      }
    }
    if (this is TripType) {
      switch (this) {
        case TripType.scheduled:
          return 'مجدولة';
        case TripType.normal:
          return 'عادية';
        case TripType.goAndBack:
          return 'ذهاب وإياب';
        case TripType.delivery:
          return 'عامل توصيل';
      }
    }

    if (this is TransferPayType) {
      switch (this) {
        case TransferPayType.driverToCompany:
          return 'من السائق للشركة';
        case TransferPayType.companyToDriver:
          return 'من الشركة للسائق';
      }
    }

    if (this is SharedRequestStatus) {
      switch (this) {
        case SharedRequestStatus.pending:
          return 'لم تبدأ';
        case SharedRequestStatus.accepted:
          return 'تم قبولها';
        case SharedRequestStatus.payed:
          return 'تم الدفع';
        case SharedRequestStatus.pickedup:
          return 'تم الركوب';
        case SharedRequestStatus.dropped:
          return 'تم النزول';
        case SharedRequestStatus.closed:
          return 'مكتملة';
      }
    }

    if (this is SharedTripStatus) {
      switch (this) {
        case SharedTripStatus.pending:
          return 'في الانتظار';
        case SharedTripStatus.started:
          return 'جارية';
        case SharedTripStatus.closed:
          return 'منتهية';
        case SharedTripStatus.canceled:
          return 'ملغية';
      }
    }

    if (this is TripStatus) {
      switch (this) {
        case TripStatus.pending:
          return 'في الانتظار';
        case TripStatus.accepted:
          return 'تم قبولها';
        case TripStatus.started:
          return 'بدأت';
        case TripStatus.completed:
          return 'منتهية';
        case TripStatus.canceled:
          return 'ملغية';
        case TripStatus.canceledByAdmin:
          return 'ملغية بواسطة المدير';
        case TripStatus.pendingManager:
          return 'في انتظار موافقة المدير';
        case TripStatus.canceledByManager:
          return 'ملغية بواسطة مدير الشركة';
      }
    }

    if (this is InstitutionType) {
      switch (this) {
        case InstitutionType.school:
          return '';
        case InstitutionType.college:
          return '';
        case InstitutionType.transportation:
          return '';
      }
    }

    if (this is DriverStatus) {
      switch (this) {
        case DriverStatus.unAvailable:
          return 'غير متاح';
        case DriverStatus.available:
          return 'متاح';
        case DriverStatus.busy:
          return 'لديه رحلة حاليا';
      }
    }

    if (this is Governorate) {
      switch (this) {
        case Governorate.damascus:
          return 'دمشق';
        case Governorate.aleppo:
          return ' ريف دمشق';
        case Governorate.homs:
          return ' حلب';
        case Governorate.hama:
          return ' حمص';
        case Governorate.latakia:
          return ' حماة';
        case Governorate.tartus:
          return ' اللاذقية';
        case Governorate.raqqa:
          return ' طرطوس';
        case Governorate.alHasakah:
          return ' الرقة';
        case Governorate.idlib:
          return ' الحسكة';
        case Governorate.deirEzZor:
          return ' إدلب';
        case Governorate.asSuwayda:
          return ' دير الزور';
        case Governorate.daraa:
          return ' السويداء';
        case Governorate.quneitra:
          return ' درعا';
        case Governorate.ruralDamascus:
          return ' القنيطرة';
      }
    }

    if (this is CompanyType) {
      switch (this) {
        case CompanyType.plans:
          return 'خطط';
      }
    }

    if (this is CarCategoryType) {
      switch (this) {
        case CarCategoryType.trips:
          return 'رحلات';
        case CarCategoryType.delivery:
          return 'توصيل';
      }
    }

    if (this is PlanType) {
      switch (this) {
        case PlanType.companies:
          return 'شركات';
        case PlanType.qareep:
          return 'قريب';
        case PlanType.individual:
          return 'فردية';
      }
    }

    if (this is DeptType) {
      switch (this) {
        case DeptType.tripPayment:
          return 'عائدات رحلة';
        case DeptType.driverCompensation:
          return 'مسافة تعويضية';
        case DeptType.planTripPayment:
          return 'رحلة اشتراكات';
      }
    }

    if (this is PlanTripStatus) {
      switch (this) {
        case PlanTripStatus.pending:
          return 'جاهزة للبدء';
        case PlanTripStatus.running:
          return 'جارية';
      }
    }

    return name;
  }

  bool get isTripActive {
    switch (this) {
      case NavTrip.waiting:
        return true;
      case NavTrip.acceptor:
        return true;
      case NavTrip.start:
        return true;
      case NavTrip.end:
        return false;
    }
    return false;
  }

  bool get isPlanTripActive {
    if (this == PlanTripStatus.running) return true;
    return false;
  }
}

class FormatDateTime {
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  const FormatDateTime({
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  String toString() {
    return '$months\n'
        '$days\n'
        '$hours\n'
        '$minutes\n'
        '$seconds\n';
  }
}

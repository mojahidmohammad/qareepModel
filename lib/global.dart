class FixUrl {
  static String fixAvatarImage(String? image) {
    if (image == null || image.isEmpty) return '';
    if (image.startsWith('http')) return image;
    final String link = "https://live.qareeb-maas.com/Images/$image";
    return link;
  }
}

enum CubitStatuses { init, done, loading, error }

enum BookingPages { selectLocation, trip, booking }

enum StateScreen { non, confirmCode, policy, main, passwordCode }

enum NavTrip { waiting, acceptor, start, end }

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

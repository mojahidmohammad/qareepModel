import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripMediator {
  LatLng startLocation;
  LatLng endLocation;
  double distance;
  double duration;
  String startLocationName;
  String endLocationName;
  int carTypeId;

  TripMediator({
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.duration,
    required this.startLocationName,
    required this.endLocationName,
    required this.carTypeId,
  });

  bool get startIsSet => startLocation.hashCode != 0;

  bool get endIsSet => endLocation.hashCode != 0;

  bool get startEnable => startLocation.hashCode == 0;

  bool get endEnable => endLocation.hashCode == 0 && !startEnable;

  bool get endInitial => endLocation.hashCode == 0;

  bool get canConfirm => startLocation.hashCode > 0 && endLocation.hashCode > 0;

  factory TripMediator.initial() {
    return TripMediator(
      startLocation: LatLng(0, 0),
      endLocation: LatLng(0, 0),
      distance: 0,
      duration: 0,
      carTypeId: 0,
      startLocationName: '',
      endLocationName: '',
    );
  }
}

import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  final double targetLatitude = -23.550520; // Latitude predefinida
  final double targetLongitude = -46.633308; // Longitude predefinida
  bool isNearTarget = false;

  Timer? _timer;

  void startLocationUpdates() {
    _startLocationUpdates();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _startLocationUpdates();
    });
  }

  Future<void> _startLocationUpdates() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1,
      ),
    ).listen((Position position) {
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );

      if (distance <= 20) {
        isNearTarget = true;
        stopLocationUpdates();
      } else {
        if(isNearTarget) {
          startLocationUpdates();
        }
        isNearTarget = false;
      }
    });
  }

  void stopLocationUpdates() {
    _timer?.cancel();
  }
}

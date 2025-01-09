import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  final double targetLatitude = -5.885995;
  final double targetLongitude = -35.363265;
  bool isNearTarget = false;
  bool locAnterior = false;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();
  StreamSubscription<Position>? _positionSubscription;

  Future<void> startLocationUpdates() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      print("Serviço de localização desativado.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permissão de localização negada.");
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("Permissão de localização permanentemente negada.");
      return;
    }

    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) async {
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );

      if (distance <= 15) {
        isNearTarget = true;
        locAnterior = true;
        print("TTTTTTAAAAAAA PPPPPEEEEEERRRRRTTTTTTOOOOOO");
        await _updateState(true);
      } else if (distance > 15) {
        print("TTTTTTAAAAAAA LLLLLLOOOOONNNNNGGGGGGEEEEEE");
        locAnterior = false;

        isNearTarget = false;
        await _updateState(false);
      }
    });
  }

  Future<void> _updateState(bool nearTarget) async {
    if (nearTarget) {
      if (!locAnterior) {
        await _db.child("rotinas/chegada/on").set(true);
        await _db.child("rotinas/saida/on").set(false);
      }
    } else {
      if (locAnterior) {
        await _db.child("rotinas/chegada/on").set(false);
        await _db.child("rotinas/saida/on").set(true);
      }
    }
  }

  void stopLocationUpdates() {
    _positionSubscription?.cancel();
  }
}

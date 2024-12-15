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

  // Esta função garante que a localização será checada periodicamente
  void startLocationUpdates() {
    _startLocationUpdates();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _startLocationUpdates(); // Chama a função periodicamente a cada 10 segundos
    });
  }

  Future<void> _startLocationUpdates() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está ativado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Serviço de localização está desativado. Por favor, ative o serviço.');
      return;
    }

    // Verifica o status da permissão
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Solicita permissão
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Permissão de localização foi negada.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permissão de localização negada permanentemente.');
      return;
    }

    // Começa a escutar as atualizações de localização
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1, // Atualizar a cada 1 metro
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
        print("Está a menos de 20 metros. Variável é: $isNearTarget");
      } else {
        isNearTarget = false;
        print("Está a mais de 20 metros. Variável é: $isNearTarget");
      }
    });
  }

  // Método para parar o Timer quando não for mais necessário
  void stopLocationUpdates() {
    _timer?.cancel();
  }
}

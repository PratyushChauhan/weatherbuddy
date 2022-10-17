import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 28.45045045045045;
  double longitude = 77.58636564854234;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error: $e');
    }
  }
}

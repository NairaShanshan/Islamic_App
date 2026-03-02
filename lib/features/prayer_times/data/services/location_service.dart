import 'package:geolocator/geolocator.dart';

class LocationService {

  static Future<bool> _handlePermission() async {

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    return true;
  }

  static Future<Position> getCurrentLocation() async {
    await _handlePermission();

    return await Geolocator.getCurrentPosition() ;
  }
}
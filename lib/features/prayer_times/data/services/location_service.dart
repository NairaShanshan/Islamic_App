import 'package:geolocator/geolocator.dart';

class LocationService {

  static Future<Position> getCurrentLocation() async {

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("LOCATION_DISABLED");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception("PERMISSION_DENIED");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("PERMISSION_DENIED_FOREVER");
    }

    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high ,
      distanceFilter: 100
    ));
  }
}
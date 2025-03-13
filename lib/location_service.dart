import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

  //Get current location city name

  static Future<String> getCityName() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location service are disabled';
    }

    //Check location Permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return 'Location permission denied';
    }

    if (permission == LocationPermission.deniedForever) {
      return 'Permission is denied permanently';
    }

    //Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Convert lat/lng to city name
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        return placemarks[0].locality ?? 'Unknown city';
      } else {
        return 'City not found';
      }
    } catch (e) {
      return 'Error getting city name: $e';
    }
    }
  }

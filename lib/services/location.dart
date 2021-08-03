import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Future<void> getCurrentLocation() async {
    try {
      print('getcurrentlocation called');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;
      print('completed getting location');
    } catch (e) {
      print(e);
    }
  }
}

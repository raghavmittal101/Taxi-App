import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/models/user_location.dart';
import 'package:location/location.dart';

class UserLocationController {
  static Future<LatLng> getCurrentLocation() async {
    Location location = Location();
    PermissionStatus  check = await location.hasPermission();
    if (check == PermissionStatus.granted ) {
      LocationData position = await location.getLocation();
      return LatLng(position.latitude, position.longitude);
    }
    return null;
  }

  // raghav: change the locations to the locations which we will use for demo
  static Future<List<UserLocation>> getSavedLocations() async {
    return [
      UserLocation.named(
          name: "Home",
          locationType: UserLocationType.Home,
          position: LatLng(2, 10),
          minutesFar: 52),
      UserLocation.named(
          name: "Innov8",
          locationType: UserLocationType.Office,
          position: LatLng(0, 0),
          minutesFar: 36),
    ];
  }
}

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/models/google_location.dart';

class LocationController {
  static Future<GoogleLocation> getCurrentLocation() async {
//    Raghav: here we will we get input from fields given in frontend(current address) and use google to get corresponding latlong
    return GoogleLocation("s9etojwM5hDVGK6U7",
        LatLng(28.6472799,76.8130644), "Delhi");
  }

  static Future<GoogleLocation> getLocationfromId(LatLng position) async {
//    Raghav: here we will we get input from fields given in frontend(destination address) and use google to get corresponding latlong
    return GoogleLocation("sdKetGNVCKhe6HV78",
        LatLng(28.6998822,77.2549408), "Noida");
  }

  static Future<List<LatLng>> getPolylines(LatLng start, LatLng end) async {
//    Raghav: here we will we get polyline using google api for the same.
    List<Map> map = [
      {"lat": 40.7835246, "lng": -73.9651392},
      {"lat": 40.74700869999999, "lng": -73.9870749},
      {"lat": 40.7836479, "lng": -73.96495809999999},
      {"lat": 40.78148909999999, "lng": -73.9627453},
      {"lat": 40.7802148, "lng": -73.9613768},
      {"lat": 40.74653929999999, "lng": -73.9859729},
      {"lat": 40.74700869999999, "lng": -73.9870749}
    ];
    return map.map((val) => LatLng(val["lat"], val["lng"])).toList();
  }
}

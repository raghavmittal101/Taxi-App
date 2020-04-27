// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/models/google_location.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class LocationController {

  static var locationDetails = {
    1: {"LatLng":LatLng(28.6472799,76.8130644) ,"zone": "1", "locationName":"location 1"},
    2: {"LatLng":LatLng(28.6998822,76.2549408) ,"zone": "2", "locationName":"location 2"},
    3: {"LatLng":LatLng(28.7000, 76.7) ,"zone": "3", "locationName":"location 3"},
    4: {"LatLng":LatLng(28.6998822,77.249408) ,"zone": "1", "locationName":"location 4"},
    5: {"LatLng":LatLng(28.7001, 76.712) ,"zone": "2", "locationName":"location 5"},
    6: {"LatLng":LatLng(28.6998822,77.2549408) ,"zone": "3", "locationName":"location 6"},
  };

  static var zoneDetails = {
    1: {"LatLng":LatLng(28.6472799,76.8130644) ,"zone": "1"},
    2: {"LatLng":LatLng(28.6998822,77.2549408) ,"zone": "2"},
    3: {"LatLng":LatLng(28.7000, 76.7) ,"zone": "3"},
  };

  static getLocationFromString(String locationName) async {
    for(var k in locationDetails.keys){
      var v=locationDetails[k]; 
      if(v["locationName"]==locationName){
        return GoogleLocation(v["LatLng"], locationName, v["zone"]);
      }
      return  GoogleLocation(locationDetails[1]["LatLng"], locationName, locationDetails[1]["zone"]);
    }
  }

  static String getZoneSeverity(String locationName){
    for(var k in locationDetails.keys){
      var location = locationDetails[k];
      if(location["locationName"].toString() == locationName.toString()){
        return location["zone"].toString();
      }
    }
    return "0";
  }
  static String getLocationNameFromPosition(LatLng position){
    for(var k in locationDetails.keys){
      var location = locationDetails[k];
      if(location["position"].toString() == position.toString()){
        return location["locationName"].toString();
      }
    }
    return "Location 1";
  }

  static getDistance(LatLng position1, LatLng position2){
    var earth_radius = 6371;
    var degToRadian = 57.29578;
    var lat = degToRadian*(position2.latitude - position1.latitude);
    var lon = degToRadian*(position2.longitude - position1.longitude);

    var a = sin(lat/2)*sin(lat/2) + cos(degToRadian*(position1.latitude)) * cos(degToRadian*(position2.latitude)) * sin(lon/2)*sin(lon/2) ;
    var c = 2*asin(sqrt(a));
    var d = earth_radius * c;

    return d;
  }
  
  static String getZoneforPosition(LatLng position){
    debugPrint("driver position: " + position.toString());
    var radius = 2000; //in km
     debugPrint("distance: "+getDistance(position, zoneDetails[1]["LatLng"]).toString());
    for(var k in zoneDetails.keys){
      var v = zoneDetails[k];
      debugPrint("distance: "+getDistance(position, v["LatLng"]).toString());
      if(getDistance(position, v["LatLng"]) <= radius){
        return v["zone"];
      }
    }
    return "1";
  }
  static Future<List<LatLng>> getPolylines(LatLng start, LatLng end) async {
//    Raghav: here we will we get polyline using google api for the same.
    // List<Map> map = [
    //   {"lat": 28.6472799, "lng": 76.8130644},
    //   {"lat": 28.6998822, "lng": 77.2549408,}
    // ];
    // return map.map((val) => LatLng(val["lat"], val["lng"])).toList();
    debugPrint("locations: "+start.toString() +" -- "+end.toString());
    return [start, end];
  }
}

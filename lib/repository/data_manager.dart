
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DataManager{
  static getLocationData(){
  var locationDetails =    {
    1: {"LatLng":LatLng(28.6472799,76.8130644) ,"zone": "1", "locationName":"location 1"},
    2: {"LatLng":LatLng(28.6998822,76.2549408) ,"zone": "2", "locationName":"location 2"},
    3: {"LatLng":LatLng(28.7000, 76.7) ,"zone": "3", "locationName":"location 3"},
    4: {"LatLng":LatLng(28.6998822,77.249408) ,"zone": "1", "locationName":"location 4"},
    5: {"LatLng":LatLng(28.7001, 76.712) ,"zone": "2", "locationName":"location 5"},
    6: {"LatLng":LatLng(28.6998822,77.2549408) ,"zone": "3", "locationName":"location 6"},
    };
    return locationDetails;
  }

  static getZoneDetails(){
    var zoneDetails ={
    1: {"LatLng":LatLng(28.6472799,76.8130644) ,"zone": "1"},
    2: {"LatLng":LatLng(28.6998822,77.2549408) ,"zone": "2"},
    3: {"LatLng":LatLng(28.7000, 76.7) ,"zone": "3"},
   };

   return zoneDetails;
  }

  static getTaxis(){
    var taxis = {
      1 :{
      "id": '1',
      "position": LatLng(27,77),
      "title": "Taxi 1",
      "plateNo": "1231"
      },
      2 : {
      "id": '2',
      "position": LatLng(27.01, 78),
      "title": "Taxi 2",
      "plateNo": "3212"
      },
      3: {
      "id": '3',
      "position": LatLng(28, 77),
      "title": "Taxi 3",
      "plateNo": "9090"
      },
      4: {
      "id": '4',
      "position": LatLng(28, 78),
      "title": "Taxi 4",
      "plateNo": "8383"
      }
    };
    return taxis;
  }

  static getTaxiDrivers(){
    var taxis = getTaxis();
    var drivers = {
    1: {
      "driverPic": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sidhu_in_Punjab.jpg/440px-Sidhu_in_Punjab.jpg",
      "driverName": "Kapoor",
      "taxiDetails": taxis[4],
      "zone":"2"
      },
     2: {
      "driverPic":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sidhu_in_Punjab.jpg/440px-Sidhu_in_Punjab.jpg",
        "driverName": "David",
        "taxiDetails": taxis[1],
        "zone": "1"
      },
     3: {
        "driverPic":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sidhu_in_Punjab.jpg/440px-Sidhu_in_Punjab.jpg",
        "driverName": "Gopi",
        "taxiDetails": taxis[2],
        "zone": "2"
        },
     4: {
          "driverPic":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sidhu_in_Punjab.jpg/440px-Sidhu_in_Punjab.jpg",
        "driverName": "Sibin",
        "taxiDetails": taxis[3],
        "zone": "3"
        }
  };
    return drivers;
  }

}
// import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/controllers/location_controller.dart';
// import 'package:taxi_app/bloc/taxi_booking_bloc.dart';
import 'package:taxi_app/models/taxi.dart';
import 'package:taxi_app/models/taxi_booking.dart';
import 'package:taxi_app/models/taxi_driver.dart';

class TaxiBookingController {
  static var taxiDrivers = {
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

  static var taxis = {
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

  // raghav: update this function to get taxi price from taxi booking controller
  static Future<double> getPrice(TaxiBooking taxiBooking) async {
    return 150;
  }

 static getTaxiDetails(Map<String, Object> details){
    return Taxi(details["id"], details["title"], true, details["plateNo"], details["position"]);
  }

  static Future<TaxiDriver> getTaxiDriver(TaxiBooking booking) async {
    var sourceZone = LocationController.getZoneSeverity(booking.source.areaDetails);
    var destinationZone = LocationController.getZoneSeverity(booking.destination.areaDetails);
    if(destinationZone == sourceZone){
      for(var k in taxiDrivers.keys){
        var driver = taxiDrivers[k];
        if(taxiDrivers[k]["zone"] == sourceZone){
          return TaxiDriver.named(
            id:k.toString(),
            driverPic:driver["driverPic"], 
            driverName:driver["driverName"], 
            taxiDetails:getTaxiDetails(driver["taxiDetails"]));
        }
      }    
  }
    return TaxiDriver.named(
      driverPic:taxiDrivers[1]["driverPic"], 
      driverName:taxiDrivers[1]["driverName"], 
      taxiDetails:getTaxiDetails(taxiDrivers[1]["taxiDetails"])
      );
}

  static Future<List<Taxi>> getTaxisAvailable() async{
    List<Taxi> taxisAvailable = [];
    taxis.forEach((k,v){
      taxisAvailable.add(
        Taxi.named(
          id: v["id"],
          position: v["position"],
          title: v["title"],
          plateNo: v["plateNo"],
          )
      );
    });
    return taxisAvailable;
  }
}

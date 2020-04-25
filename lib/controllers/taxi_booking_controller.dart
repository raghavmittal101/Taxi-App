import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/models/taxi.dart';
import 'package:taxi_app/models/taxi_booking.dart';
import 'package:taxi_app/models/taxi_driver.dart';

class TaxiBookingController {
  // raghav: update this function to get taxi price from taxi booking controller
  static Future<double> getPrice(TaxiBooking taxiBooking) async {
    return 150;
  }

  static Future<TaxiDriver> getTaxiDriver(TaxiBooking booking) async {
    // raghav: change driver name and pic
    return TaxiDriver.named(
        driverPic:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sidhu_in_Punjab.jpg/440px-Sidhu_in_Punjab.jpg",
        driverName: "Ram kapoor",
        driverRating: 4.5,
        taxiDetails: "Toyota (BFD823-434)");
  }

  static Future<List<Taxi>> getTaxisAvailable() async {
    List<Taxi> taxis = [
      Taxi.named(id: '1',
          position: LatLng(27,77),
          title: "Taxi 1"),
      Taxi.named(id: '2',
          position: LatLng(27.01, 78),
          title: "Taxi 2"),
      Taxi.named(id: '3',
          position: LatLng(28, 77),
          title: "Taxi 3"),
      Taxi.named(id: '4',
          position: LatLng(28, 78),
          title: "Taxi 4")
    ];
    return taxis;
  }
}

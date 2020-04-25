import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleLocation {
  final LatLng position;
  final String areaDetails;

  GoogleLocation(this.position, this.areaDetails);

  GoogleLocation.named({this.position, this.areaDetails});
}

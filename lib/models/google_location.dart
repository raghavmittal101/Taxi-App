import 'package:google_maps_flutter/google_maps_flutter.dart';


// raghav: we either need to change this model to accomodate returning a latlong using location name instead
// of passing the latlong and placeid;
// placeId is not required in google_maps_flutter.
class GoogleLocation {
  final String placeId;
  final LatLng position;
  final String areaDetails;

  GoogleLocation(this.placeId, this.position, this.areaDetails);

  GoogleLocation.named({this.placeId, this.position, this.areaDetails});
}

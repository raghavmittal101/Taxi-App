import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/models/google_location.dart';

abstract class TaxiBookingEvent extends Equatable {
  TaxiBookingEvent();
}

class TaxiBookingStartEvent extends TaxiBookingEvent {
  @override
  List<Object> get props => null;
}

class DestinationSelectedEvent extends TaxiBookingEvent {
  final LatLng destination;

  DestinationSelectedEvent({@required this.destination});

  @override
  List<Object> get props => [destination];
}

class DetailsSubmittedEvent extends TaxiBookingEvent {
  final GoogleLocation source;
  final GoogleLocation destination;

  DetailsSubmittedEvent(
      {@required this.source,
      @required this.destination,
     });

  @override
  List<Object> get props => [source, destination];
}

class TaxiSelectedEvent extends TaxiBookingEvent {

  @override
  List<Object> get props => null;
}

class BackPressedEvent extends TaxiBookingEvent {
  @override
  List<Object> get props => null;
}

class TaxiBookingCancelEvent extends TaxiBookingEvent {
  @override
  List<Object> get props => null;
}
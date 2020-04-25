import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_app/bloc/taxi_booking_event.dart';
import 'package:taxi_app/bloc/taxi_booking_state.dart';
import 'package:taxi_app/controllers/location_controller.dart';
import 'package:taxi_app/controllers/taxi_booking_controller.dart';
import 'package:taxi_app/models/google_location.dart';
import 'package:taxi_app/models/taxi.dart';
import 'package:taxi_app/models/taxi_booking.dart';
import 'package:taxi_app/models/taxi_driver.dart';
import 'package:taxi_app/storage/taxi_booking_storage.dart';

class TaxiBookingBloc extends Bloc<TaxiBookingEvent, TaxiBookingState> {
  @override
  TaxiBookingState get initialState => TaxiBookingNotInitializedState();

  @override
  Stream<TaxiBookingState> mapEventToState(TaxiBookingEvent event) async* {
    if (event is TaxiBookingStartEvent) {
      debugPrint("event1");
      List<Taxi> taxis = await TaxiBookingController.getTaxisAvailable();
      yield TaxiBookingNotSelectedState(taxisAvailable: taxis);
    }
    if (event is RideNowEvent) {
      TaxiBookingStorage.open();
      debugPrint("event2");
      yield TaxiBookingLoadingState(
          state: DetailsNotFilledState(booking: null));
      TaxiBooking taxiBooking = await TaxiBookingStorage.getTaxiBooking();
      yield DetailsNotFilledState(booking: taxiBooking);
      }
    if(event is DestinationDetailsEnteredEvent){
      debugPrint("event3");
      GoogleLocation source = await LocationController.getLocationFromString(event.source);
      debugPrint(source.areaDetails);
      GoogleLocation destination =
          await LocationController.getLocationFromString(event.destination);
      debugPrint(destination.position.toString());
      await TaxiBookingStorage.addDetails(TaxiBooking.named(
          source: source, destination: destination));
      debugPrint("event3.1");

      // event = DetailsSubmittedEvent(destination: destination, source: source);
      TaxiBooking booking = await TaxiBookingStorage.getTaxiBooking();
      yield TaxiNotSelectedState(
        booking: booking,
      );
      TaxiBooking prevBooking = await TaxiBookingStorage.getTaxiBooking();
      double price = await TaxiBookingController.getPrice(prevBooking);
      await TaxiBookingStorage.addDetails(
          TaxiBooking.named(estimatedPrice: price));   
    }
    
    if(event is TaxiSelectedEvent){
      TaxiBooking booking = await TaxiBookingStorage.getTaxiBooking();
      TaxiDriver taxiDriver =
          await TaxiBookingController.getTaxiDriver(booking);
      await Future.delayed(Duration(seconds: 1));
      yield TaxiBookingConfirmedState(booking: booking, driver: taxiDriver);
      await Future.delayed(Duration(seconds: 8));
      yield TaxiRideCompleteState();
    }
 
    if (event is TaxiBookingCancelEvent) {
      yield TaxiBookingCancelledState();
      await Future.delayed(Duration(milliseconds: 500));
      List<Taxi> taxis = await TaxiBookingController.getTaxisAvailable();
      yield TaxiBookingNotSelectedState(taxisAvailable: taxis);
      
    }
    if (event is BackPressedEvent) {
      switch (state.runtimeType) {
        case DetailsNotFilledState:
          List<Taxi> taxis = await TaxiBookingController.getTaxisAvailable();
          yield TaxiBookingNotSelectedState(taxisAvailable: taxis);
          break;
        case TaxiNotSelectedState:
          yield DetailsNotFilledState(
              booking: (state as TaxiNotSelectedState).booking);
          break;
      }
    }
  }
}

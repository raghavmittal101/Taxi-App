import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/bloc/taxi_booking_bloc.dart';
import 'package:taxi_app/bloc/taxi_booking_event.dart';
import 'package:taxi_app/bloc/taxi_booking_state.dart';
import 'package:taxi_app/models/google_location.dart';
import 'package:taxi_app/models/taxi_booking.dart';
import 'package:taxi_app/widgets/rounded_button.dart';

class TaxiBookingDetailsWidget extends StatefulWidget {
  @override
  _TaxiBookingDetailsWidgetState createState() =>
      _TaxiBookingDetailsWidgetState();
}

class _TaxiBookingDetailsWidgetState extends State<TaxiBookingDetailsWidget> {
  GoogleLocation source, destination;
  @override
  void initState() {
    super.initState();
    TaxiBooking taxiBooking = (BlocProvider.of<TaxiBookingBloc>(context).state
            as DetailsNotFilledState)
        .booking;
    source = taxiBooking.source;
    destination = taxiBooking.destination;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  // raghav: remove soure?.areaDetails in order to get input from user
                  buildInputWidget(source?.areaDetails, "hint", () {}),
                  SizedBox(
                    height: 16.0,
                  ),
                  // raghav: remove destination?.areaDetails in order to get input from user
                  buildInputWidget(destination?.areaDetails,
                      "Enter your destination", () {}),
                  SizedBox(
                    height: 84.0,
                  ),
                  
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              RoundedButton(
                onTap: () {
                  BlocProvider.of<TaxiBookingBloc>(context)
                      .add(BackPressedEvent());
                },
                iconData: Icons.keyboard_backspace,
              ),
              SizedBox(
                width: 18.0,
              ),
              Expanded(
                flex: 2,
                child: RoundedButton(
                  text: "See Next",
                  onTap: () {
                    BlocProvider.of<TaxiBookingBloc>(context).add(
                        DetailsSubmittedEvent(
                            destination: destination,
                            source: source,));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String val, bool enabled) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: enabled ? Colors.black : Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(12.0)),
        child: Text(
          "$val",
          style: Theme.of(context).textTheme.headline.copyWith(
              color: enabled ? Colors.white : Colors.black, fontSize: 15.0),
        ));
  }
  
  Widget buildInputWidget(String text, String hint, Function() onTap) {
    // raghav: here we need to create a input field for getting address from user
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        text ?? hint,
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(color: text == null ? Colors.black45 : Colors.black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

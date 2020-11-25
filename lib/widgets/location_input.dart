import 'package:flutter/material.dart';
import 'package:great_places/widgets/little_map.dart';
import "package:latlong/latlong.dart";
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final void Function(LatLng) onLocationSelected;

  const LocationInput({this.onLocationSelected});

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  LatLng _latLng;

  @override
  void initState() {
    super.initState();
    Location().getLocation().then((locData) {
      setState(() {
        this._latLng = LatLng(locData.latitude, locData.longitude);
        widget.onLocationSelected(this._latLng);
      });
    });
  }

  Future<void> _getUserLocationHandler() async {
    final locData = await Location().getLocation();
    setState(() {
      this._latLng = LatLng(locData.latitude, locData.longitude);
    });
    widget.onLocationSelected(this._latLng);
  }

  void _mapTapHandler(LatLng latLng) {
    // Not setting state to don't update the whole screen
    widget.onLocationSelected(this._latLng);
    setState(() {
      this._latLng = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 145,
          width: double.infinity,
          child: this._latLng == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : LittleMap(
                  onCoordinatesUpdate: this._mapTapHandler,
                  coordinates: this._latLng,
                ),
        ),
        FlatButton.icon(
          icon: Icon(Icons.location_on),
          label: Text('Current Location'),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            this._getUserLocationHandler();
          },
        ),
      ],
    );
  }
}

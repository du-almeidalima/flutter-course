import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";

class LittleMap extends StatefulWidget {
  final void Function(LatLng) onCoordinatesUpdate;
  final LatLng coordinates;

  const LittleMap({this.onCoordinatesUpdate, this.coordinates});

  @override
  _LittleMapState createState() => _LittleMapState();
}

class _LittleMapState extends State<LittleMap> {
  MapController _mapController;

  @override
  void initState() {
    super.initState();
    this._mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: this._mapController,
      options: MapOptions(
        center: LatLng(
          widget.coordinates?.latitude,
          widget.coordinates?.longitude,
        ),
        zoom: 13.0,
        onTap: (LatLng latLng){
          if (widget.onCoordinatesUpdate != null) {
            widget.onCoordinatesUpdate(latLng);
            this._mapController.move(latLng, 13.0);
          }
        },
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(
                widget.coordinates?.latitude,
                widget.coordinates?.longitude,
              ),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

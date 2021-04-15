import 'package:bco_chat/views/preview-view/map_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final LatLng coordinates;
  final bool clickable;

  const MapWidget({Key key, this.coordinates, this.clickable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onTap: (LatLng _) {
          if (this.clickable) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MapPreview(coordinates: this.coordinates)));
          }
        },
        markers: Set.of([
          Marker(
              markerId: MarkerId('markerid'),
              position: LatLng(coordinates.latitude, coordinates.longitude))
        ]),
        initialCameraPosition: CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(coordinates.latitude, coordinates.longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414));
  }
}

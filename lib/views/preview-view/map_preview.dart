import 'package:bco_chat/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreview extends StatelessWidget {
  final LatLng coordinates;

  MapPreview({@required this.coordinates});

  @override
  Widget build(BuildContext context) {
    return MapWidget(coordinates: coordinates);
  }
}

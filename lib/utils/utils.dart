import 'dart:math';

import 'package:bco_chat/views/preview-view/image_preview.dart';
import 'package:bco_chat/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Widget getMessage(
    String username, String type, Map<String, dynamic> content, context) {
  switch (type) {
    case 'text':
      return Text(content['text'],
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white));

      break;
    case 'image':
      return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ImagePreview(
                    username: username, imageUrl: content['imageUrl'])));
          },
          child: Image.network(content['imageUrl']));
    case 'location':
      return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: MapWidget(
              coordinates: LatLng(content['latitude'], content['longitude']),
              clickable: true));
    default:
      return SizedBox.shrink();
  }
}

getUserLocation() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}

Color getRandomColor() {
  Random random = Random();
  List<Color> colors = [
    Colors.red[900],
    Colors.purple[900],
    Colors.pink[900],
    Colors.orange[900],
    Colors.deepOrange[900],
    Colors.blue[900]
  ];
  return colors[random.nextInt(6)];
}

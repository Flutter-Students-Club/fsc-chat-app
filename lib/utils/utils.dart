import 'package:flutter/material.dart';

Widget getMessage(String type, Map<String, dynamic> content, context) {
  switch (type) {
    case 'text':
      return Text(content['text'],
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white));

      break;
    case 'image':
      return Image.network(content['imageUrl']);
    default:
      return SizedBox.shrink();
  }
}

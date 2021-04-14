import 'package:bco_chat/widgets/app_title_widget.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String username, imageUrl;
  ImagePreview({@required this.username, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitleWidget(title: this.username)),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(this.imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}

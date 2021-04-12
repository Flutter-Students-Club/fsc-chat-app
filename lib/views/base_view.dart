import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final AppBar appBar;
  final Widget child;

  BaseView({@required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.appBar != null ? this.appBar : null,
        body: Padding(
          padding: EdgeInsets.all(15),
          child: this.child,
        ));
  }
}

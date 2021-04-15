import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final AppBar appBar;
  final Widget child;
  final FloatingActionButton floatingActionButton;

  BaseView({@required this.child, this.appBar, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: this.floatingActionButton != null
            ? this.floatingActionButton
            : null,
        appBar: this.appBar != null ? this.appBar : null,
        body: Padding(
          padding: EdgeInsets.all(15),
          child: this.child,
        ));
  }
}

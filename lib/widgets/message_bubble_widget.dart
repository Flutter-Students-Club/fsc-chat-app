import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  final int index;

  MessageBubbleWidget({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.blue : Colors.blue[900],
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * .5,
        child: Text('merhaba $index',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white)),
      ),
    );
  }
}

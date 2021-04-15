import 'package:bco_chat/widgets/message_bubble_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListMessageWidget extends StatelessWidget {
  final Stream streamData;
  final ScrollController scrollController;
  const ListMessageWidget(
      {Key key, @required this.streamData, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: this.streamData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                controller: scrollController != null ? scrollController : null,
                separatorBuilder: (_, __) => SizedBox(height: 15),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (_, index) =>
                    MessageBubbleWidget(chatData: snapshot.data.docs[index]));
          } else {
            return SizedBox.shrink();
          }
        });
  }
}

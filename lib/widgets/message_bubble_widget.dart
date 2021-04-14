import 'package:bco_chat/core/storage.dart';
import 'package:bco_chat/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../core/string_extensions.dart';
import '../utils/utils.dart';

class MessageBubbleWidget extends StatelessWidget {
  final QueryDocumentSnapshot chatData;
  final ChatService chatService = ChatService.instance;

  MessageBubbleWidget({@required this.chatData});

  bool sameUser() {
    return Storage.getString('username') == this.chatData.data()['username']
        ? true
        : false;
  }

  showDeleteDialog(context) {
    if (sameUser()) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Emin misiniz?'),
                content: Text('Bu işlem geri alınamaz'),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Geri Dön')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                      onPressed: () {
                        chatService.deleteMessage(this.chatData.id);
                        Navigator.of(context).pop();
                      },
                      child: Text('Evet Eminim')),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDeleteDialog(context);
      },
      child: Align(
        alignment: sameUser() ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
              color: sameUser() ? Colors.blue : Colors.blue[900],
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((this.chatData.data()['username'] as String).capitalize,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(
                      DateTime.parse(this.chatData['time'].toDate().toString())
                              .hour
                              .toString() +
                          ':' +
                          DateTime.parse(
                                  this.chatData['time'].toDate().toString())
                              .minute
                              .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white))
                ],
              ),
              getMessage(
                  this.chatData.data()['username'],
                  this.chatData.data()['type'],
                  this.chatData.data()['content'],
                  context),
            ],
          ),
        ),
      ),
    );
  }
}

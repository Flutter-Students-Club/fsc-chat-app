import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:bco_chat/widgets/app_title_widget.dart';
import 'package:bco_chat/widgets/list_message_widget.dart';
import 'package:flutter/material.dart';

class UserMessages extends StatelessWidget {
  final String username;
  final ChatService chatService = ChatService.instance;
  UserMessages({@required this.username});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: AppBar(title: AppTitleWidget(title: this.username)),
        child: ListMessageWidget(
          streamData: chatService.chatStream
              .where('username', isEqualTo: this.username)
              .snapshots(),
        ));
  }
}

import 'package:bco_chat/routes/routes.dart';
import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/services/user_service.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:bco_chat/widgets/app_title_widget.dart';
import 'package:bco_chat/widgets/user_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final ChatService chatService = ChatService.instance;

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService.instance;
    TextEditingController message = TextEditingController();

    pinnedMessage(context) {
      return showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Mesaj sabitle 🖋'),
                content: TextField(
                  controller: message,
                  decoration: InputDecoration(filled: true),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        if (message.text.trim().length > 0) {
                          await chatService.updatePinnedMessage(message.text);
                          Navigator.of(context).pushNamed(Routes.homeRoute);
                        }
                      },
                      child: Text('Sabitle'))
                ],
              ));
    }

    return BaseView(
        appBar: _appBar(context),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  pinnedMessage(context);
                },
                child: Text('Mesaj Sabitle')),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: userService.users.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(height: 20),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (_, index) =>
                              UserCardWidget(user: snapshot.data.docs[index]));
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            )
          ],
        ));
  }

  Widget _appBar(context) =>
      AppBar(title: AppTitleWidget(title: 'Kullanıcılar'));
}

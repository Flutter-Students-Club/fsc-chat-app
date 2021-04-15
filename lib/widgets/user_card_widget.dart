import 'package:bco_chat/views/user-view/user_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../core/string_extensions.dart';
import '../utils/utils.dart';

class UserCardWidget extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserCardWidget({@required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: getRandomColor(),
        radius: 35,
        child: Text((this.user['username'] as String).firstLetter,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white)),
      ),
      title: Text((this.user['username'] as String).capitalize,
          style: Theme.of(context).textTheme.headline5),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => UserMessages(username: this.user['username'])));
        },
        icon: Icon(Icons.message),
      ),
    );
  }
}

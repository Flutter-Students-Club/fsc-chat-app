import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/widgets/list_message_widget.dart';
import 'package:flutter/material.dart';

class HomeSearchDelegate extends SearchDelegate {
  ChatService chatService = ChatService.instance;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.keyboard_arrow_left),
        onPressed: () => Navigator.of(context).pop());
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListMessageWidget(
            streamData: chatService.chatStream
                .where('content.text', isGreaterThanOrEqualTo: query)
                .snapshots()));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

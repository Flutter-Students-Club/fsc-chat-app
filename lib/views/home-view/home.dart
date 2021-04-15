import 'package:bco_chat/routes/routes.dart';
import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:bco_chat/views/home-view/home_search_delegate.dart';
import 'package:bco_chat/views/home-view/home_state.dart';
import 'package:bco_chat/widgets/list_message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends HomeState {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        floatingActionButton: showScroll
            ? FloatingActionButton(
                mini: true,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.arrow_downward),
                onPressed: scrollToBottom)
            : null,
        appBar: _appBar,
        child: Stack(
          children: [
            Column(
              children: [_messages, _sendMessage],
            ),
            _pinnedMessage
          ],
        ));
  }

  Widget get _appBar => AppBar(
      leading: IconButton(
        color: Colors.white,
        icon: Icon(Icons.people),
        onPressed: () => Navigator.of(context).pushNamed(Routes.usersRoute),
      ),
      actions: [
        IconButton(
            color: Colors.white,
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: HomeSearchDelegate())),
      ],
      title: Image.asset('assets/images/logo.png'));

  Widget get _messages => Expanded(
      child: ListMessageWidget(
          streamData: chatService.chatStream
              .orderBy('time', descending: false)
              .snapshots(),
          scrollController: scrollController));

  Widget get _sendMessage => TextField(
        controller: message,
        onChanged: (String text) {
          if (text.length > 0) {
            setState(() => showIcons = false);
          } else {
            setState(() => showIcons = true);
          }
        },
        decoration: InputDecoration(
            filled: true,
            suffixIcon: Wrap(
              children: [
                showIcons
                    ? IconButton(
                        icon: Icon(Icons.image),
                        onPressed: sendImage,
                      )
                    : SizedBox.shrink(),
                showIcons
                    ? IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: sendLocation,
                      )
                    : SizedBox.shrink(),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            )),
      );

  Widget get _pinnedMessage => showPinnedMessage
      ? StreamBuilder<DocumentSnapshot>(
          stream: chatService.pinnedMessage.doc(PINNED_MESSAGE_ID).snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Dismissible(
                    onDismissed: (DismissDirection direction) {
                      setState(() => showPinnedMessage = false);
                    },
                    key: UniqueKey(),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(snapshot.data['message'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink();
          })
      : SizedBox.shrink();
}

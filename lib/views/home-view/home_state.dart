import 'dart:io';

import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/utils/utils.dart';
import 'package:bco_chat/views/home-view/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

abstract class HomeState extends State<Home> {
  TextEditingController message = TextEditingController();
  ScrollController scrollController = ScrollController();
  final ChatService chatService = ChatService.instance;
  final picker = ImagePicker();
  bool showScroll = false;
  bool showPinnedMessage = true;
  bool showIcons = true;

  sendMessage() {
    if (message.text.trim().length > 0) {
      chatService.sendMessage({"text": message.text}, "text");
      message.text = '';
      FocusScope.of(context).unfocus();
    }
  }

  sendImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final image = File(pickedFile.path);
    chatService.sendImage(image);
  }

  sendLocation() async {
    final location = await getUserLocation();
    if (location is LocationData) {
      chatService.sendMessage(
          {"latitude": location.latitude, "longitude": location.longitude},
          "location");
    }
  }

  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    setState(() {
      showScroll = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      chatService.chatStream.snapshots().listen((event) {
        Future.delayed(Duration(seconds: 1)).then((_) {
          if (scrollController.offset <
              scrollController.position.maxScrollExtent) {
            setState(() {
              showScroll = true;
            });
          } else {
            setState(() {
              showScroll = false;
            });
          }
        });
      });
    });
  }
}

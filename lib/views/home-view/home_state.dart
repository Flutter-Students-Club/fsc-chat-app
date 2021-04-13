import 'dart:io';

import 'package:bco_chat/services/chat_service.dart';
import 'package:bco_chat/views/home-view/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeState extends State<Home> {
  TextEditingController message = TextEditingController();
  final ChatService chatService = ChatService.instance;
  final picker = ImagePicker();
  bool showIcons = true;

  sendMessage() {
    if (message.text.trim().length > 0) {
      chatService.sendMessage({"text": message.text}, "text");
      message.text = '';
    }
  }

  sendImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final image = File(pickedFile.path);
    chatService.sendImage(image);
  }
}

import 'dart:io';
import 'dart:math';

import 'package:bco_chat/core/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

const String COLLECTION_NAME = 'chat';

class ChatService {
  ChatService._privateConstructor();

  static final ChatService _instance = ChatService._privateConstructor();

  static ChatService get instance => _instance;

  CollectionReference chat =
      FirebaseFirestore.instance.collection(COLLECTION_NAME);
  var chatStream = FirebaseFirestore.instance.collection(COLLECTION_NAME);

  sendMessage(Map<String, dynamic> content, String type) {
    chat.add({
      "username": Storage.getString('username'),
      "time": DateTime.now(),
      "content": content,
      "type": type
    });
  }

  sendImage(File image) async {
    print(image);
    Random random = Random();
    String fileName = random.nextInt(99999).toString() + '.png';
    await firebase_storage.FirebaseStorage.instance
        .ref('images/$fileName')
        .putFile(image);
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('images/$fileName')
        .getDownloadURL();
    this.sendMessage({"imageUrl": downloadURL}, "image");
  }

  deleteMessage(String id) {
    chat.doc(id).delete();
  }
}

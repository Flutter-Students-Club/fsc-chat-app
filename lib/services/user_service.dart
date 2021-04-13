import 'package:bco_chat/core/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String COLLECTION_NAME = 'users';

class UserService {
  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  static UserService get instance => _instance;
  CollectionReference users =
      FirebaseFirestore.instance.collection(COLLECTION_NAME);

  createUser(String username) async {
    Storage.saveString('username', username);
    bool result = await this.userExist(username);
    if (result) {
      await users.add({"username": username});
    } else {
      return false;
    }
  }

  Future<bool> userExist(String username) async {
    final response = await users.where("username", isEqualTo: username).get();
    if (response.docs.length > 0) {
      return false;
    } else {
      return true;
    }
  }
}

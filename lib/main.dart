import 'package:bco_chat/core/storage.dart';
import 'package:bco_chat/routes/routes.dart';
import 'package:bco_chat/styles/custom_theme.dart';
import 'package:bco_chat/views/home-view/home.dart';
import 'package:bco_chat/views/sign-in-view/sign_in.dart';
import 'package:bco_chat/views/splash-view/splash.dart';
import 'package:bco_chat/views/user-view/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Storage.initialStorage();
  // Storage.deleteStorage('username');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      title: 'BCO Chat',
      home: Splash(),
      routes: {
        Routes.homeRoute: (_) => Home(),
        Routes.usersRoute: (_) => Users(),
        Routes.signInRoute: (_) => SignIn()
      },
    );
  }
}

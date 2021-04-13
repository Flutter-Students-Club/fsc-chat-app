import 'package:bco_chat/core/storage.dart';
import 'package:bco_chat/routes/routes.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print(userCredential);
      Future.delayed(Duration(seconds: 1)).then((value) {
        if (Storage.getString('username') != null) {
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.signInRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_image, _text],
      ),
    ));
  }

  Widget get _image => Image.asset('assets/images/splash.png');

  Widget get _text => TweenAnimationBuilder(
        duration: Duration(seconds: 1),
        tween: Tween<double>(begin: 20, end: 70),
        builder: (_, double value, __) {
          return Wrap(
            children: [
              Text('BCO',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: value,
                      color: Theme.of(context).primaryColor)),
              Text('Chat',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: value, color: Theme.of(context).primaryColor))
            ],
          );
        },
      );
}

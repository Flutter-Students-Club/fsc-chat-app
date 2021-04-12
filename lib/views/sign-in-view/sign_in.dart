import 'package:bco_chat/styles/custom_theme.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final TextEditingController name = TextEditingController();

  signIn() {
    if (name.text.trim().length > 0) {
      print('OK!');
    } else {
      print('NO!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(scaffoldBackgroundColor: Theme.of(context).primaryColor),
      child: BaseView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _greetingText1(context),
              SizedBox(height: 20),
              _greetingText2(context),
              SizedBox(height: 20),
              _textField
            ],
          ),
        ),
      ),
    );
  }

  Widget _greetingText1(context) => Text('Merhaba',
      style:
          Theme.of(context).textTheme.headline2.copyWith(color: Colors.white));

  Widget _greetingText2(context) => Text(
        'Devam etmeden önce tanışalım mı ? 👩‍💻👨‍💻',
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
      );

  Widget get _textField => TextField(
        controller: name,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              color: Colors.white,
              icon: Icon(Icons.keyboard_arrow_right_outlined),
              onPressed: signIn,
            ),
            filled: true),
      );
}

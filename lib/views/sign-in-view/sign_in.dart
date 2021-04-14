import 'package:bco_chat/routes/routes.dart';
import 'package:bco_chat/services/user_service.dart';
import 'package:bco_chat/views/base_view.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final UserService userService = UserService.instance;

  signIn(context) async {
    if (name.text.trim().length > 0) {
      final response = await userService.createUser(name.text);
      if (response == false) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Hata 😥'),
                  content: Text('Bu isimde kayıt yapılmış.'),
                ));
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      }
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
              _textField(context)
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

  Widget _textField(context) => TextField(
        controller: name,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              color: Colors.white,
              icon: Icon(Icons.keyboard_arrow_right_outlined),
              onPressed: () => signIn(context),
            ),
            filled: true),
      );
}

import 'package:bco_chat/views/base_view.dart';
import 'package:bco_chat/widgets/app_title_widget.dart';
import 'package:bco_chat/widgets/user_card_widget.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: _appBar(context),
        child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(height: 20),
            itemCount: 10,
            itemBuilder: (_, index) => UserCardWidget()));
  }

  Widget _appBar(context) =>
      AppBar(title: AppTitleWidget(title: 'Kullanıcılar'));
}

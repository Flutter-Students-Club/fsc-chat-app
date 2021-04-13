import 'package:bco_chat/widgets/message_bubble_widget.dart';
import 'package:flutter/material.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.keyboard_arrow_left),
        onPressed: () => Navigator.of(context).pop());
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          separatorBuilder: (_, __) => SizedBox(height: 15),
          itemCount: 25,
          itemBuilder: (_, index) =>Text('aaa')),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class OverView extends StatefulWidget {
  final RestListModel rest;
  OverView({Key key, this.rest}) : super(key: key);

  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  String finalRating;
  var _rating;
  String review = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  launch(('tel:${widget.rest.international_phone_number}'));
                })
          ],
        ))
      ],
    ));
  }
}

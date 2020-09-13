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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              widget.rest.international_phone_number == ''
                  ? Container()
                  : Container(
                      child: GestureDetector(
                          onTap: () {
                            launch(
                                ('tel:${widget.rest.international_phone_number}'));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: Row(
                                children: [
                                  Container(
                                    child: IconButton(
                                      iconSize: 40,
                                      icon: Icon(Icons.call),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width/1.4,
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        '${widget.rest.international_phone_number}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                    ),
              widget.rest.website == ''
                  ? Container()
                  : Container(
                      child: GestureDetector(
                          onTap: () {
                            launch(('${widget.rest.website}'));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: IconButton(
                                          iconSize: 40,
                                          icon: Icon(Icons.language),
                                          onPressed: () {
                                            launch(('${widget.rest.website}'));
                                          }),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.4,
                                        child: GestureDetector(
                                            onTap: () {
                                              launch(('${widget.rest.website}'));
                                            },
                                            child: Text(
                                              '${widget.rest.website}',
                                              style: TextStyle(
                                                fontSize: 20
                                              ),
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: IconButton(
                                          iconSize: 40,
                                          icon: Icon(Icons.location_on),
                                          onPressed: () {

                                          }),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.4,
                                        child: Text(
                                          '${widget.rest.address}',
                                          
                                          style: TextStyle(
                                            fontSize: 20
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
            ],
          ),
        ));
  }
}
// IconButton(
//     icon: Icon(Icons.call),
//     onPressed: () {
//       launch(('tel:${widget.rest.international_phone_number}'));
//     })

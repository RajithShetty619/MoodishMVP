import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future loadAllData() async {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAllData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return;
      },
    );
  }
}

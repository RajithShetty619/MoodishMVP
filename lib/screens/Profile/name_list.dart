import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/name.dart';
import 'package:provider/provider.dart';

class NameList extends StatefulWidget {
  @override
  _NameListState createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  @override
  Widget build(BuildContext context) {
    final names = Provider.of<List<Name>>(context);

    return Container();
  }
}

import 'package:flutter/material.dart';

class Feeed extends StatefulWidget {
  final String title;
  // final bool isActive;
  int index;
  int stIndex;
  final Function press;
  Feeed({
    Key key,
    this.title,
    this.stIndex,
    this.index,
    // this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  _FeeedState createState() => _FeeedState();
}

class _FeeedState extends State<Feeed> { 
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: <Widget>[
          Text(widget.title,
              style: widget.stIndex == widget.index
                  ? TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)
                  : TextStyle(color: Colors.grey[400], fontSize: 18)),
          widget.stIndex == widget.index
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 3,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                )
              : Container(),
        ],
      ),
    );
  }
}

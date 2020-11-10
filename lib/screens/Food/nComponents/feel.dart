import 'package:flutter/material.dart';

class Feel extends StatefulWidget {
  final String title;
  final int index;
  final int stIndex;
  final Function press;
  const Feel({
    Key key,
    this.title,
    this.index,
    this.stIndex,
    this.press,
  }) : super(key: key);

  @override
  _FeelState createState() => _FeelState();
}

class _FeelState extends State<Feel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        children: <Widget>[
          if (widget.stIndex == widget.index)
            RotatedBox(
              quarterTurns: -1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          RotatedBox(
            quarterTurns: -1,
            child: Text(widget.title,
                style: widget.stIndex == widget.index
                    ? TextStyle(
                        color: Colors.orange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

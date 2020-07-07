import 'package:flutter/material.dart';

class EveryTaste extends StatefulWidget {
  final String title;
  final int index;
  final int stIndex;
  final Function press;
  const EveryTaste({
    Key key, 
    this.title, 
    this.index,
    this.stIndex,
    this.press,
  }) : super(key: key);

  @override
  _EveryTasteState createState() => _EveryTasteState();
}

class _EveryTasteState extends State<EveryTaste> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              widget.title,
              style: widget.stIndex == widget.index? TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ): TextStyle(color: Colors.grey[400],fontSize: 18)
            ),
            if (widget.stIndex == widget.index) 
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: 22,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ],
        ),
     
    );
  }
}

import 'package:flutter/material.dart';

class EverySituation extends StatefulWidget {
  final String title;
  // final bool isActive;
  final int index;
  final int stIndex;
  final Function press;
  const EverySituation({
    Key key,
    this.title,
    this.stIndex,
    this.index,
    // this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  _EverySituationState createState() => _EverySituationState();
}

class _EverySituationState extends State<EverySituation> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = widget.index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(widget.title,
                style: _selected == widget.stIndex
                    ? TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)
                    : TextStyle(color: Colors.grey[400], fontSize: 18)),
            _selected == widget.stIndex
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
      ),
    );
  }
}

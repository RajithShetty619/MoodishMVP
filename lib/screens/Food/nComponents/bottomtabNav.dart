import 'package:flutter/material.dart';

class BottomInfoTab extends StatefulWidget {
  const BottomInfoTab({
    Key key,
    this.selected,
    this.title,
    this.index,
  }) : super(key: key);

  final int index;
  final String title;
  final int selected;

  @override
  _BottomInfoTabState createState() => _BottomInfoTabState();
}

class _BottomInfoTabState extends State<BottomInfoTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(
          children: <Widget>[
            widget.index == widget.selected
                ? Container(
                    height: 5,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.orange,
                    ),
                  )
                : Container(
                    height: 5,
                  ),
            Text(
              widget.title,
              style: widget.index == widget.selected
                  ? TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange)
                  : TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EveryTaste extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function press;
  const EveryTaste({
    Key key, 
    this.title, 
    this.isActive = false, 
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: isActive? TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ): TextStyle(color: Colors.grey[400],fontSize: 18)
            ),
            if (isActive) 
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
      ),
    );
  }
}

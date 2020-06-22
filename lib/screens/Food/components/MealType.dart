
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/components/typeDetails.dart';

class MealType extends StatelessWidget {
  const MealType({
    Key key,
    @required this.image,
    @required this.types,
  }) : super(key: key);

  final image;
  final types;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
 
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Detailed_Type())); 
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.1),
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    types,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

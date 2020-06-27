import 'package:flutter/material.dart';

class General extends StatelessWidget {
  const General({
    Key key,
    @required this.image,
    @required this.title,
    @required this.desc,
  }) : super(key: key);

  final image;
  final title;
  final desc;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.1,
      child: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.1),
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text(desc, style: TextStyle(color: Colors.white, fontSize: 20,),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
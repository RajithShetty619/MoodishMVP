import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/pages/foodHome.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  List<GridTileBuilder> mood = [
    GridTileBuilder(image: 'happy.png', mood: 'happy', currentOpacity: 1),
    GridTileBuilder(image: 'healthy.png', mood: 'healthy', currentOpacity: 1),
    GridTileBuilder(image: 'sad.png', mood: 'sad', currentOpacity: 1),
    GridTileBuilder(image: 'angry.jpg', mood: 'anger', currentOpacity: 1),
    GridTileBuilder(image: 'sluggish.png', mood: 'sluggish', currentOpacity: 1),
    GridTileBuilder(image: 'stress.png', mood: 'stress', currentOpacity: 1),
  ];
  String pref; //all the user preferences are saved here
  String err = '';
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: _visible ? 1.0 : 0.0,
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'How do you feel?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.pinkAccent),
                    /* children: [
                        TextSpan(
                            text: 'mood',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Colors.orange))
                      ] */
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 7.0,
                        mainAxisSpacing: 7.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: mood.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            String _val = mood[index].mood;
                            Future.delayed(Duration(milliseconds: 400), () {
                              setState(() {
                                 Navigator.pop(context,_val);
                              });
                            });
                            setState(() {
                              _visible = false;
                            });
                          },
                          child: Container(
                            height: 125.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/${mood[index].image}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                '${mood[index].mood}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridTileBuilder {
  String image;
  String mood;
  double currentOpacity;
  bool _visible = true;
  GridTileBuilder({this.mood, this.image, this.currentOpacity});
}

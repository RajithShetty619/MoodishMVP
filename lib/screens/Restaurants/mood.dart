import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  List<GridTileBuilder> mood = [
    GridTileBuilder(image: 'happy.png', mood: 'Happy', currentOpacity: 1),
    GridTileBuilder(image: 'healthy.png', mood: 'Healthy', currentOpacity: 1),
    GridTileBuilder(image: 'sad.png', mood: 'Sad', currentOpacity: 1),
    GridTileBuilder(image: 'angry.jpg', mood: 'Angry', currentOpacity: 1),
    GridTileBuilder(image: 'sluggish.png', mood: 'Sluggish', currentOpacity: 1),
    GridTileBuilder(image: 'stress.png', mood: 'Stress', currentOpacity: 1),
  ];
  int i = 0;
  List<String> pref = []; //all the user preferences are saved here 
  String err = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Know Your\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.pinkAccent),
                    children: [
                      TextSpan(
                          text: 'Mood.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 50,
                              color: Colors.orange))
                    ]),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Any 3 Cuisine of your type :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  ),
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
                          dynamic _val = mood[index];
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              mood.remove(_val);
                              print(pref);
                              if (mood.length < 1) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainScreen();
                                }));
                              }
                            });
                          });
                          setState(() {
                            pref.add(_val.mood);
                            i++;
                            mood[index]._visible = !mood[index]._visible;
                          });
                        },
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: mood[index]._visible ? 1.0 : 0.0,
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
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: (i + 1 > 3)
                          ? Align(
                              alignment: Alignment.center,
                              child: Text(''),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Text(
                                err,
                                style: TextStyle(color: Colors.red),
                              ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: () {
                        if (i + 1 > 3)
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return MainScreen(
                              );
                            }),
                          );
                        else
                          setState(() {
                            err = 'Select  ${3 - i} more!';
                          });
                      },
                      color: Colors.green,
                      child: Text('Next->'),
                    ),
                  ),
                ],
              )
            ],
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

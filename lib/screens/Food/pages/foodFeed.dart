import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBloc.dart';
import 'package:moodish_mvp/screens/Food/components/foodMood.dart';
import 'package:moodish_mvp/screens/Food/components/maFeed.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:moodish_mvp/screens/Food/events/pollsEvent.dart';
import 'package:moodish_mvp/screens/Food/myFeed/foodft.dart';
import 'package:moodish_mvp/screens/Food/myFeed/polls.dart';
import 'package:moodish_mvp/screens/Food/myFeed/recipe.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';

import 'package:moodish_mvp/screens/Restaurants/mood.dart';

class FoodFeed extends StatefulWidget {
  final int number;
  final String mood;

  FoodFeed({Key key, this.mood, this.number}) : super(key: key);

  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class Deter {
  int id;
  String deter;

  Deter(this.id, this.deter);
  static List<Deter> getDeter() {
    return <Deter>[
      Deter(1, 'veg'),
      Deter(2, 'non-veg'),
      Deter(3, 'both'),
    ];
  }
}

class _FoodFeedState extends State<FoodFeed> {
  int numbr;
  String moodSelection;
  bool loadingData1 = false;
  bool loadingData2 = false;
  DatabaseQuery _dq = DatabaseQuery(listName: "0");
  DatabaseQuery _dqtaste2 = DatabaseQuery(listName: "d2");
  DatabaseQuery _dqtaste0 = DatabaseQuery(listName: "d0");
  DatabaseQuery _dqtaste1 = DatabaseQuery(listName: "d1");
  int indx = 1;
  bool _visible = true;
  List<GridTileBuilder> mood = [
    GridTileBuilder(image: 'happy.png', mood: 'happy', currentOpacity: 1),
    GridTileBuilder(image: 'healthy.png', mood: 'healthy', currentOpacity: 1),
    GridTileBuilder(image: 'sad.png', mood: 'sad', currentOpacity: 1),
    GridTileBuilder(image: 'angry.jpg', mood: 'anger', currentOpacity: 1),
    GridTileBuilder(image: 'sluggish.png', mood: 'sluggish', currentOpacity: 1),
    GridTileBuilder(image: 'stress.png', mood: 'stress', currentOpacity: 1),
  ];
  int det = 2;
  List<Deter> _deter = Deter.getDeter();
  List<DropdownMenuItem<Deter>> _dropdown;
  Deter _selectedDeter;

  @override
  void initState() {
    super.initState();

    Random random = new Random();
    int randomNumber = random.nextInt(3);
    setState(() {
      numbr = randomNumber;
      print("pppppppppppppppppppp");
      print(numbr);
    });

    _dropdown = buildDropDown(_deter);
    _selectedDeter = _dropdown[2].value;
  }

  List<DropdownMenuItem<Deter>> buildDropDown(List deters) {
    List<DropdownMenuItem<Deter>> items = List();
    for (Deter deter in deters) {
      items.add(DropdownMenuItem(
        value: deter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              deter.deter,
            ),
          ),
        ),
      ));
    }
    return items;
  }

  onChangedDeter(Deter selectedDeter) {
    setState(() {
      _selectedDeter = selectedDeter;
    });
    if (_selectedDeter.id == 1) {
      setState(() {
        det = 0;
      });
    } else if (_selectedDeter.id == 2) {
      setState(() {
        det = 1;
      });
    } else {
      setState(() {
        det = 2;
      });
    }
    print(det);
  }

  data(BuildContext dataContext, String mood) async {
    Box _box = await Hive.openBox("preferenceBox");
    String deter = _box.get("deter");

    if (deter != "veg" && deter != "nonveg") {
      Random random = new Random();
      int randomNumber = random.nextInt(2);
      if (randomNumber == 1)
        deter = "veg";
      else
        deter = "nonveg";
    }
    _dq.getFood(
        field: ['mood', 'deter'],
        value: [mood, deter],
        limit: 10,
        check: 0).then((future) {
      setState(() {
        moodSelection = mood;
        BlocProvider.of<FoodBloc>(dataContext).add(FoodEvent.add(future, "0"));
      });
    });
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _visible ? 0 : 1,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
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
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 6,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: mood.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext itemContext, index) {
                        return GestureDetector(
                          onTap: () {
                            String _val = mood[index].mood;
                            data(context, _val);
                            Future.delayed(Duration(milliseconds: 400), () {
                              setState(() {
                                _visible = false;
                              });
                            });
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 250.0,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${mood[index].image}'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              Container(
                                height: 250.0,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        stops: [
                                          .1,
                                          .9
                                        ],
                                        colors: [
                                          Colors.black.withOpacity(.5),
                                          Colors.black.withOpacity(.1),
                                        ])),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${mood[index].mood[0].toUpperCase()}${mood[index].mood.substring(1)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 400),
          opacity: !_visible ? 1.0 : 0.0,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Container(
                            width: 230.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.blue[200],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Food for Your Mood',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        child: BlocConsumer<FoodBloc,
                            Map<String, List<FoodListModel>>>(
                          buildWhen: (Map<String, List<FoodListModel>> previous,
                              Map<String, List<FoodListModel>> current) {
                            return true;
                          },
                          listenWhen:
                              (Map<String, List<FoodListModel>> previous,
                                  Map<String, List<FoodListModel>> current) {
                            if (current.length > previous.length) {
                              return true;
                            }
                            return false;
                          },
                          builder: (BuildContext context, foodList) {
                            if (foodList["0"].length < 1) {
                              return Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.blueAccent,
                                ),
                              );
                            }
                            return Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: foodList["0"].length,
                                itemBuilder: (BuildContext context, index) {
                                  if (foodList["0"].length == 0)
                                    return SpinKitChasingDots(
                                      color: Colors.blueAccent,
                                    );
                                  return Mood_Food(
                                    foodList: foodList["0"][index],
                                  );
                                },
                              ),
                            );
                          },
                          listener: (context, foodList) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Added!')),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 120.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'My Feed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // GestureDetector(
                          //   child: Feeed(
                          //     title: 'All',
                          //     // isActive: true,
                          //     index: indx,
                          //     stIndex: 0,
                          //     press: () {},
                          //   ),
                          //   onTap: () {
                          //     setState(() {
                          //       indx = 0;
                          //     });
                          //   },
                          // ),
                          GestureDetector(
                            child: Feeed(
                              title: 'Recipe',
                              // isActive: true,
                              index: indx,
                              stIndex: 1,
                              press: () {},
                            ),
                            onTap: () {
                              setState(() {
                                indx = 1;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Feeed(
                              title: 'Polls',
                              // isActive: true,
                              index: indx,
                              stIndex: 2,
                            ),
                            onTap: () async {
                              BetaCount().count(field: 'polls');
                              setState(() {
                                indx = 2;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Feeed(
                              title: 'Food For Thought',
                              // isActive: true,
                              index: indx,
                              stIndex: 3,
                              press: () {},
                            ),
                            onTap: () async {
                              BetaCount().count(field: 'fft');
                              setState(() {
                                indx = 3;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        if (indx == 1)
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 1),
                                  child: Row(children: <Widget>[
                                    Text(
                                      'Veg Only',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(width: 5),
                                    CupertinoSwitch(
                                      value: isSwitched,
                                      onChanged: (val) {
                                        setState(() {
                                          isSwitched = val;
                                          det = 0;
                                        });
                                      },
                                      trackColor: Colors.grey,
                                      activeColor: Colors.lightGreen,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                child: BlocConsumer<FoodBloc,
                                    Map<String, List<FoodListModel>>>(
                                  buildWhen: (Map<String, List<FoodListModel>>
                                          previous,
                                      Map<String, List<FoodListModel>>
                                          current) {
                                    return true;
                                  },
                                  listenWhen: (Map<String, List<FoodListModel>>
                                          previous,
                                      Map<String, List<FoodListModel>>
                                          current) {
                                    if (current.length > previous.length) {
                                      return true;
                                    }
                                    return false;
                                  },
                                  builder: (BuildContext context, foodList) {
                                    return Container(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: foodList["d$det"].length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return RecipeTab(
                                            foodList: foodList["d$det"][index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  listener: (context, foodList) {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Added!')),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        if (indx == 2)
                          Column(
                            children: <Widget>[
                              if (numbr == 0) Container(child: YesNoTabs()),
                              if (numbr == 1) Container(child: PollTabs()),
                              if (numbr == 2) Container(child: This_ThatTabs()),
                            ],
                          ),
                        if (indx == 3) Container(child: FoodftTab()),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

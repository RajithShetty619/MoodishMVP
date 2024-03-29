import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:moodish_mvp/screens/Food/myFeed/foodft.dart';
import 'package:moodish_mvp/screens/Food/myFeed/polls.dart';
import 'package:moodish_mvp/screens/Food/nComponents/RecommSeemore.dart';
import 'package:moodish_mvp/screens/Food/nComponents/feel.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodCard.dart';
import 'package:moodish_mvp/screens/Food/nComponents/latestRecipe.dart';
import 'package:moodish_mvp/screens/Food/nComponents/moodSelector.dart';
import 'package:moodish_mvp/screens/Food/nComponents/nFoodBg.dart';
import 'package:moodish_mvp/screens/Food/nComponents/topRecipes.dart';

class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  List<GridTileBuilder> feel = [
    GridTileBuilder(feel: 'Happy', isSelected: false),
    GridTileBuilder(feel: 'Stressed', isSelected: false),
    GridTileBuilder(feel: 'Angry', isSelected: false),
    GridTileBuilder(feel: 'Sad', isSelected: false),
    // GridTileBuilder(feel: 'Healthy', isSelected: false),
    GridTileBuilder(feel: 'Sluggish', isSelected: false),
  ];
  bool isSelected = false;
  int i = 0;
  int _visible = 0;
  List<String> pref = [];
  String greeting;
  int indxT = 0;
  int indexP = 0;
  int numbr = 2;
  Map<String, dynamic> userData = {};
  String mood;
  bool tapped = false;

  @override
  void initState() {
    super.initState();

    Random random = new Random();
    int randomNumber = random.nextInt(3);
    setState(() {
      numbr = randomNumber;
      print(numbr);
    });
    data() async {
      Box box = await Hive.openBox('Userdata');
      setState(() {
        userData = box.get('userdata');
      });
    }

    data();
  }

  // void _awaitReturnValueFromSecondScreen(BuildContext context) async {
  //   // start the SecondScreen and wait for it to finish with a result
  //   final result = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => MenuSelector(),
  //       ));

  //   // after the SecondScreen result comes back update the Text widget with it
  //   setState(() {
  //     mood = result;
  //   });
  //   print("*************$mood");
  //   if (mood != null) {
  //     moodGet(context, mood);
  //     i++;
  //   } else {
  //     setState(() {
  //       i = 0;
  //     });
  //   }
  // }

// using call back to change the Index of IndexedStack after selecting mood
  void callback(newI, mood) async {
    moodGet(context, mood);
    setState(() async {
      i = newI;
    });
  }

  moodGet(BuildContext dataContext, String mood) async {
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
    DatabaseQuery(listName: "mood").getFood(
        field: ['mood'],
        value: [mood],
        limit: 7,
        mood: mood,
        deter: deter,
        check: 0).then((future) {
      setState(() {
        BlocProvider.of<FoodBloc>(dataContext)
            .add(FoodEvent.add(future, "mood"));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime morn = DateTime.parse("2000-05-04 06:00:04Z");
    DateTime aftr = DateTime.parse("2000-05-04 12:00:04Z");
    DateTime even = DateTime.parse("2000-05-04 16:00:04Z");
    DateTime night = DateTime.parse("2000-05-04 20:00:04Z");
    if (now.hour <= aftr.hour && now.hour >= morn.hour) {
      setState(() {
        greeting = 'Morning';
        print(greeting);
      });
    } else if (now.hour <= even.hour && now.hour >= aftr.hour) {
      setState(() {
        greeting = 'AfterNoon';
      });
    } else if (now.hour <= night.hour && now.hour >= even.hour) {
      setState(() {
        greeting = 'Evening';
      });
    } else {
      setState(() {
        greeting = 'Night Snacks';
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CurvedShape(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 4),
                              child: Text(
                                'Hello ${userData['name'] ?? 'name'}, ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'Good ${greeting}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended Recipes',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width / 20.3,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          splashColor: Color.fromARGB(255, 254, 197, 140),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeMoreRecipes(
                                          user: userData['name'],
                                        )));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'See more',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //outer column for alignment
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Feel(
                              title: "Feeling",
                              // isActive: true,
                              index: indxT,
                              stIndex: 0,
                              press: () {},
                            ),
                            onTap: () async {
                              setState(() {
                                indxT = 0;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Feel(
                              title: "Veg Only",
                              // isActive: true,
                              index: indxT,
                              stIndex: 1,
                              press: () {},
                            ),
                            onTap: () async {
                              setState(() {
                                indxT = 1;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Feel(
                              title: "Trending",
                              // isActive: true,
                              index: indxT,
                              stIndex: 2,
                              press: () {},
                            ),
                            onTap: () async {
                              setState(() {
                                indxT = 2;
                              });
                            },
                          ),
                        ],
                      ),
                      if (indxT == 0) // Feeling
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (i == 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'How do you Feel?',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Flexible(
                                  child: IndexedStack(
                                index: i,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.8,
                                      child: Center(
                                        child: MenuSelector(
                                            tapped: tapped,
                                            val: i,
                                            callback: callback),
                                      ),
                                      // child: GridView.builder(
                                      //     gridDelegate:
                                      //         SliverGridDelegateWithFixedCrossAxisCount(
                                      //       crossAxisCount: 2,
                                      //       crossAxisSpacing: 1.0,
                                      //       mainAxisSpacing: 1,
                                      //     ),
                                      //     scrollDirection: Axis.horizontal,
                                      //     physics: BouncingScrollPhysics(),
                                      //     itemCount: feel.length,
                                      //     shrinkWrap: true,
                                      //     itemBuilder:
                                      //         (BuildContext context, index) {
                                      //       return GestureDetector(
                                      //         onTap: () {
                                      //           print("pressesesesesesd5362");
                                      //           dynamic _val = feel[index];
                                      //           setState(() {
                                      //             if (feel[index].isSelected ==
                                      //                 true) {
                                      //               pref.remove(feel[index].feel);
                                      //               i--;
                                      //             }
                                      //             if (feel[index].isSelected ==
                                      //                 false) {
                                      //               moodGet(context, _val.feel);
                                      //               pref.add(_val.feel);
                                      //               i++;
                                      //             }
                                      //             print(i);
                                      //             print(pref);
                                      //             print(pref.contains(_val.feel));
                                      //           });
                                      //           setState(() {
                                      //             feel[index].isSelected =
                                      //                 !feel[index].isSelected;
                                      //           });
                                      //         },
                                      //         child: ClipRRect(
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //           child: Container(
                                      //               margin: EdgeInsets.all(8),
                                      //               decoration: BoxDecoration(
                                      //                 border: feel[index]
                                      //                         .isSelected
                                      //                     ? Border.all(
                                      //                         color:
                                      //                             Colors.orange,
                                      //                         width: 2)
                                      //                     : Border.all(
                                      //                         color: Colors.black,
                                      //                         width: 2),
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         250),
                                      //               ),
                                      //               child: Center(
                                      //                   child: feel[index]
                                      //                           .isSelected
                                      //                       ? Text(
                                      //                           '${feel[index].feel}',
                                      //                           style: TextStyle(
                                      //                               color: Colors
                                      //                                   .orange),
                                      //                         )
                                      //                       : Text(
                                      //                           '${feel[index].feel}',
                                      //                           style: TextStyle(
                                      //                             fontSize: 20,
                                      //                           )))),
                                      //         ),
                                      //       );
                                      //     }),
                                    ),
                                  ),
                                  if (i != 0)
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.5,
                                          child: BlocConsumer<FoodBloc,
                                              Map<String, List<FoodListModel>>>(
                                            buildWhen: (Map<String,
                                                        List<FoodListModel>>
                                                    previous,
                                                Map<String, List<FoodListModel>>
                                                    current) {
                                              return true;
                                            },
                                            listenWhen: (Map<String,
                                                        List<FoodListModel>>
                                                    previous,
                                                Map<String, List<FoodListModel>>
                                                    current) {
                                              if (current.length >
                                                  previous.length) {
                                                return true;
                                              }
                                              return false;
                                            },
                                            builder: (BuildContext context,
                                                foodList) {
                                              return Container(
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount:
                                                      foodList["mood"].length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          index) {
                                                    return FoodCrd(
                                                      index: index,
                                                      listName: "mood",
                                                      foodList: foodList["mood"]
                                                          [index],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            listener: (context, foodList) {
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text('Added!')),
                                              );
                                            },
                                          )),
                                    ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      //VegOnly
                      if (indxT == 1)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: BlocConsumer<FoodBloc,
                                  Map<String, List<FoodListModel>>>(
                                buildWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  return true;
                                },
                                listenWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  if (current.length > previous.length) {
                                    return true;
                                  }
                                  return false;
                                },
                                builder: (BuildContext context, foodList) {
                                  return Container(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: foodList["d0"].length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return FoodCrd(
                                          listName: "d0",
                                          index: index,
                                          foodList: foodList["d0"][index],
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
                        ),
                      if (indxT == 2) //Trending
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: BlocConsumer<FoodBloc,
                                  Map<String, List<FoodListModel>>>(
                                buildWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  return true;
                                },
                                listenWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  if (current.length > previous.length) {
                                    return true;
                                  }
                                  return false;
                                },
                                builder: (BuildContext context, foodList) {
                                  return Container(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: foodList["trend"].length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return FoodCrd(
                                          listName: "trend",
                                          index: index,
                                          foodList: foodList["trend"][index],
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
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15.0, top: 25),
                    child: TopRecipes(), //TopRecipes Card
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 15, right: 15.0, top: 25),
                  //   child: LatestRecipes(), //Latest Recipes card
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                    child: Text(
                      'Are You Bored?',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //inner cloumn for image and text
                          GestureDetector(
                            child: Feel(
                              title: "Food For Thought",
                              // isActive: true,
                              index: indexP,
                              stIndex: 0,
                              press: () {},
                            ),
                            onTap: () async {
                              setState(() {
                                indexP = 0;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Feel(
                              title: "Polls",
                              // isActive: true,
                              index: indexP,
                              stIndex: 1,
                              press: () {},
                            ),
                            onTap: () async {
                              setState(() {
                                indexP = 1;
                              });
                            },
                          ),
                        ],
                      ),
                      if (indexP == 0)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.7,
                              child: FoodftTab(),
                            ),
                          ),
                        ),
                      if (indexP == 1 && numbr == 0)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.1,
                              child: PollTabs(),
                            ),
                          ),
                        ),
                      if (indexP == 1 && numbr == 1)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.6,
                              child: YesNoTabs(),
                            ),
                          ),
                        ),
                      if (indexP == 1 && numbr == 2)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.6,
                              child: This_ThatTabs(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWithText({image, txt}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(txt),
        ],
      ),
    );
  }
}

class GridTileBuilder {
  String feel;
  bool isSelected;
  GridTileBuilder({this.feel, this.isSelected});
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: CurvePainter_1(),
      ),
    );
  }
}

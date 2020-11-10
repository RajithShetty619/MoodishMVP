import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodBg2.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';

class SeeMoreRecipes extends StatefulWidget {
  @override
  _SeeMoreRecipesState createState() => _SeeMoreRecipesState();
}

class _SeeMoreRecipesState extends State<SeeMoreRecipes> {
  String greeting;
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
              children: [
                Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5, top: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, bottom: 4),
                                child: Text(
                                  'hello user, ',
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
                        ],
                      ),
                    )),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "All Recipes",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Text(
                        "Sorted by Your Preferences",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, foodList) {
                    return ListView.builder(
                        itemCount: foodList["recomrecipe"].length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          FoodListModel element =
                              foodList["recomrecipe"][index];
                          return Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                top: 5,
                                bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FoodInfoCard(
                                    foodList: foodList["recomrecipe"][index],
                                  );
                                }));
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 8, bottom: 8, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 160,
                                              child: Text(
                                                element.foodName,
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Container(
                                                width: 170,
                                                child: Text(
                                                  element.cuisine != 'nan'
                                                      ? element.cuisine
                                                      : element.deter,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey[400]),
                                                )),
                                            // Text(
                                            //   element.restaurant_Location,
                                            //   style: TextStyle(
                                            //       color: Colors.grey[300],
                                            //       fontSize: 11),
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Container(
                                                height: 1,
                                                width: 175,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.fireplace,
                                                  size: 10,
                                                ),
                                                Text(
                                                  element.calories,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(
                                                  Icons.watch_later_rounded,
                                                  size: 10,
                                                ),
                                                Text(
                                                  element.time,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                // Text(
                                                //   '\u20B9 Free',
                                                //   style: TextStyle(fontSize: 10),
                                                // )
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          element.images),
                                                  fit: BoxFit.cover)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: CurvePainter_2(),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';

class FoodRecipePage extends StatefulWidget {
  @override
  _FoodRecipePageState createState() => _FoodRecipePageState();
}

class _FoodRecipePageState extends State<FoodRecipePage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'snacks';

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15, top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TopCard(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, foodList) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Time of the day',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(children: [
                            // Text(foodList["tod"][0].meal_type,
                            //     style: TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.grey[600],
                            //         fontWeight: FontWeight.w500)),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward_rounded),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'breakfast',
                                'side dish',
                                'snacks',
                                'main course'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ]),
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: foodList["tod"].length,
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodInfoCard(
                                          listName: "tod",
                                          index: index,
                                          foodList: foodList["tod"][index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 10, top: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              foodList["tod"][index].images),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.55,
                                      child: Text(
                                        foodList["tod"][index].foodName,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      foodList["tod"][index].cuisine,
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    Container(
                                      height: 0.8,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      color: Colors.grey[400],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.fastfood,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(foodList["tod"][index].calories,
                                            style: TextStyle(fontSize: 13)),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.alarm,
                                          size: 12,
                                        ),
                                        Text(
                                            foodList["tod"][index].time ?? '--',
                                            style: TextStyle(fontSize: 13))
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Container(
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black87),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                        child: Text(
                                      'Cook',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, foodList) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Craving',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Text(foodList["craving"][0].cuisine,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.grey[600],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodInfoCard(
                                          listName: "carving",
                                          index: index,
                                          foodList: foodList["craving"][index],
                                        )));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              foodList["craving"][index]
                                                  .images),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.55,
                                      child: Text(
                                        foodList["craving"][index].foodName,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      foodList["craving"][index].cuisine,
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    Container(
                                      height: 0.8,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      color: Colors.grey[400],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.fastfood,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                            foodList["craving"][index].calories,
                                            style: TextStyle(fontSize: 13)),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.alarm,
                                          size: 12,
                                        ),
                                        Text(
                                            foodList["craving"][index].time ??
                                                '--',
                                            style: TextStyle(fontSize: 13))
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Container(
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black87),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                        child: Text(
                                      'Cook',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/today.jpeg'),
                        fit: BoxFit.cover)),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Top Recipes",
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ],
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Color.fromARGB(255, 255, 246, 246),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "For all cuisines, tastes and locations! The best place to find major recipes curated for now, this time and place"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

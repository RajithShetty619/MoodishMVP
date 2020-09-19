import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class LikedFood extends StatefulWidget {
  @override
  _LikedFoodState createState() => _LikedFoodState();
}

class _LikedFoodState extends State<LikedFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Liked Food',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          FutureBuilder(
            future: DatabaseQuery().getLikedFood(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<FoodListModel> foodList = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount: foodList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                        );
                      }),
                );
              } else {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.blueAccent,
                  ),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}

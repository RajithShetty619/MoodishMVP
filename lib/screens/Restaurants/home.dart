import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Food/events/restEvent.dart';
import 'package:moodish_mvp/screens/Restaurants/booking.dart';
import 'package:moodish_mvp/screens/Restaurants/dineout.dart';
import 'package:moodish_mvp/screens/Restaurants/pickup.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/resataurantReview.dart';
import 'package:moodish_mvp/screens/Restaurants/toprated.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import '../Food/blocs/restBloc/restBloc.dart';
import '../../Services/geolocationRest.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {

  Position _currentPosition;
  bool dialogShow = true;
  String location = 'Mumbai,Maharashtra';
  Geolocator geolocator = Geolocator();
  Widget error_loadIcon = Icon(Icons.error);

  loadRest() async {
    await GeolocationRest().getRestFromLocation().then((rest) {
      setState(() {
        BlocProvider.of<RestaurantBloc>(context)
            .add(RestaurantEvent.add(rest, 'r1'));
      });
    });

    await DatabaseQuery().getRest().then((rest) {
      setState(() {
        BlocProvider.of<RestaurantBloc>(context)
            .add(RestaurantEvent.add(rest, 'r2'));
      });
    });
  }

  errGeorest() async {
    await GeolocationRest().getRestFromLocation().then((rest) {
      setState(() {
        BlocProvider.of<RestaurantBloc>(context)
            .add(RestaurantEvent.add(rest, 'r1'));
      });
    });
  }

  getCurrentLocation() async {
    geolocator.isLocationServiceEnabled();
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
    });
    print(position);
    return position;
  }

  _getAddressFromLatLng() async {
    try {
      setState(() {
        location = 'Wait a Moment...';
      });
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];

      setState(() {
        location = "${place.subLocality},${place.locality}-${place.postalCode}";
      });
      print(location);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences;

    // displayShowCase() async {
    //   preferences = await SharedPreferences.getInstance();
    //   bool showCaseVisibilityStstus = preferences.getBool("displayShowCase");
    //   preferences.setBool('displayShowCase', false);
    //   if(showCaseVisibilityStstus == null){
    //     return true;
    //   }
    //   return false;
    // }

    // displayShowCase().then((status) {
    //   if(status){
    //      ShowCaseWidget.of(context).startShowCase([
    //     _rest,
    //   ]);
    //   }
    // });

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ShowCaseWidget.of(context).startShowCase([
    //     _rest,
    //   ]);
    // });

    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text(location),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Near you',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 380,
                  child: BlocConsumer<RestaurantBloc,
                      Map<String, List<RestListModel>>>(
                    buildWhen: (Map<String, List<RestListModel>> previous,
                        Map<String, List<RestListModel>> current) {
                      return true;
                    },
                    listenWhen: (Map<String, List<RestListModel>> previous,
                        Map<String, List<RestListModel>> current) {
                      if (current.length > previous.length) {
                        return true;
                      }
                      return false;
                    },
                    listener: (context, foodList) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Added!')),
                      );
                    },
                    builder: (context, restList) {
                      if (restList["r1"].length < 1) {
                        return Container(
                          child: Center(
                            child: FlatButton.icon(
                                onPressed: () async {
                                  setState(() {
                                    error_loadIcon = Icon(Icons.hourglass_full);
                                  });

                                  await errGeorest();

                                  Future.delayed(
                                      const Duration(milliseconds: 3000), () {
                                    setState(() {
                                      error_loadIcon = Icon(Icons.error);
                                    });
                                  });
                                },
                                icon: error_loadIcon,
                                label: Text(error_loadIcon !=
                                        Icon(Icons.hourglass_full)
                                    ? "Some error has occurred, please retry!"
                                    : "Retrying please wait.")),
                          ),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: restList["r1"].length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomePage(
                                          restaurant: restList['r1'][index],
                                        )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                          imageUrl:
                                              restList['r1'][index].photo_url,
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Container(
                                              height: 205,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover)),
                                            );
                                          }),
                                      Container(
                                        width: 250,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 180,
                                                  child: Text(
                                                    restList["r1"][index]
                                                        .restaurant_Name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, top: 3),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        size: 18,
                                                      ),
                                                      Text(
                                                        restList["r1"][index]
                                                            .rating,
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, bottom: 5),
                                          child: Text(
                                              restList["r1"][index].cuisines),
                                        ),
                                      ),
                                      Container(
                                        width: 250,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 3, top: 5),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_on,
                                                  size: 20,
                                                ),
                                                Text(restList["r1"][index]
                                                    .restaurant_Location,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 5),
                                        child: Container(
                                          width: 250,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3),
                                                  child: GestureDetector(
                                                    onTap: () => Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            child: RestaurantReview(
                                                                rest: restList[
                                                                        "r1"]
                                                                    [index]))),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Icon(
                                                            Icons.library_books,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Review',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  )),
              SizedBox(
                height: 3.0,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              //   child: Container(
              //     alignment: Alignment.centerLeft,
              //     child: RichText(
              //       text: TextSpan(
              //           text: 'Categories',
              //           style: TextStyle(
              //               fontSize: 26,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black),
              //           children: [
              //             TextSpan(
              //                 text: '.',
              //                 style: TextStyle(
              //                     fontSize: 40,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.pinkAccent))
              //           ]),
              //     ),
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       getCategory('Dine_out.png', 'Dineout', context, 1),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       getCategory('Booking.png', 'Booking', context, 2),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       getCategory('Pickup.png', 'Pick Up', context, 3),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       getCategory('Top_Rated.png', 'Top Rated', context, 4),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Top Restaurant',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              BlocConsumer<RestaurantBloc, Map<String, List<RestListModel>>>(
                  buildWhen: (Map<String, List<RestListModel>> previous,
                      Map<String, List<RestListModel>> current) {
                return true;
              }, listenWhen: (Map<String, List<RestListModel>> previous,
                      Map<String, List<RestListModel>> current) {
                if (current.length > previous.length) {
                  return true;
                }
                return false;
              }, listener: (context, foodList) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Added!')),
                );
              }, builder: (context, restList) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount: restList["r2"].length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: restura(restList["r2"][index], context),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Restaurants {
  String image;
  String image1;
  String image2;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc, this.image1, this.image2});
}

//Widget getCategory(String imgName, String name, context, int tile) {
//  return Column(
//    children: <Widget>[
//      InkWell(
//        borderRadius: BorderRadius.circular(90),
//        onTap: () {
//          if (tile == 1)
//            Navigator.push(
//                context,
//                PageTransition(
//                    type: PageTransitionType.rightToLeft, child: DineOut()));
//
//          if (tile == 2)
//            Navigator.push(
//                context,
//                PageTransition(
//                    type: PageTransitionType.rightToLeft, child: Booking()));
//          if (tile == 3)
//            Navigator.push(
//                context,
//                PageTransition(
//                    type: PageTransitionType.rightToLeft, child: PickUp()));
//          if (tile == 4)
//            Navigator.push(
//                context,
//                PageTransition(
//                    type: PageTransitionType.rightToLeft, child: TopRated()));
//        },
//        child: Container(
//          height: 90,
//          width: 90,
//          decoration: BoxDecoration(
//              border: Border.all(color: Colors.orange, width: 2.0),
//              shape: BoxShape.circle,
//              image: DecorationImage(
//                  image: AssetImage('assets/${imgName}'), fit: BoxFit.cover)),
//        ),
//      ),
//      Text(name),
//    ],
//  );
//}

Widget restura(
  RestListModel rest,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: HomePage(
                  restaurant: rest,
                )));
      },
      child: Card(
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20.0)
       ),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: rest.photo_url,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 120,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width-190,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              rest.restaurant_Name,
                              overflow: TextOverflow.ellipsis,
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 18,
                          ),
                          rest.rating=='5'?
                          Text(
                            '${rest.rating}.0',
                            style: TextStyle(fontSize: 12),
                          ):
                          Text(rest.rating,style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width-145,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(rest.cuisines,maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          Text(rest.restaurant_Location),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            )


          ],
        ),
      ),
    ),
  );
}

//import 'package:flutter/material.dart';
//import 'package:moodish_mvp/screens//Restaurants/booking.dart';
//import 'package:moodish_mvp/screens//Restaurants/dineout.dart';
//import 'package:moodish_mvp/screens//Restaurants/pickup.dart';
//import 'package:moodish_mvp/screens//Restaurants/toprated.dart';
//import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
//
//class Restaurant extends StatefulWidget {
//  @override
//  _RestaurantState createState() => _RestaurantState();
//}
//
//class _RestaurantState extends State<Restaurant> {

//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        itemCount: rest.length,
//        itemBuilder: (context, index) {
//          return Column(
//            children: <Widget>[
//              if (index == 0)
//                Column(children: <Widget>[
////                  RichText(
////                    text: TextSpan(
////                        text: 'Restaurants',
////                        style: TextStyle(
////                            fontWeight: FontWeight.bold,
////                            fontSize: 60,
////                            color: Colors.black
////                        ),
////                        children: [
////                          TextSpan(
////                              text: '.',
////                              style: TextStyle(
////                                  fontWeight: FontWeight.w500,
////                                  fontSize: 100,
////                                  color: Colors.pinkAccent
////                              )
////                          )
////                        ]
////                    ),
////                  ),
////                  SizedBox(height: 10.0,),
////                  SingleChildScrollView(
////                    scrollDirection: Axis.horizontal,
////                    child: Row(
////                      children: <Widget>[
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                shape: BoxShape.circle,
////                                image: DecorationImage(
////                                  image: AssetImage('assets/Spicy.jpg'),
////                                    fit: BoxFit.cover,
////                                ),
////                                border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Spicy',
////                            style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                              fontWeight: FontWeight.bold
////                            ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Italian.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Italian',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Coffee.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Aromatic',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Beverage.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Beverages',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Chocolate.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Chocolate',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                      ],
////                    ),
////                  ),
//                  SizedBox(height: 15.0,),
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: TextField(
//                      autocorrect: true,
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                        hintText: 'Where do you want to go?',
//                        hintStyle: TextStyle(color: Colors.white),
//                        prefixIcon: Icon(
//                          Icons.search,
//                          color: Colors.white,
//                        ),
//                        filled: true,
//                        fillColor: Colors.black,
//                        enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Center(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.location_on),
//                        Text('Mumbai,Maharashtra')
//                      ],
//                    ),
//                  ),
////                  Container(
////                    decoration: BoxDecoration(
////                        gradient: LinearGradient(
////                            begin: Alignment.topCenter,
////                            end: Alignment.bottomCenter,
////                            colors: )),
////                    child: Column(
////                      children: <Widget>[
////                        SizedBox(height: 20.0,),
////                        Container(
////                          alignment: Alignment(0.0, 0.0),
////                          padding: EdgeInsets.only(top: 10.0),
////                          child: Text(
////                            'Hungry, Pradyum?',
////                            style: TextStyle(
////                                fontSize: 30.0,
////                                fontWeight: FontWeight.bold),
////                          ),
////                        ),
////                        SizedBox(
////                          height: 5.0,
////                        ),
////                        Center(
////                          child: Row(
////                            mainAxisAlignment: MainAxisAlignment.center,
////                            children: <Widget>[
////                              Container(
////                                alignment: AlignmentDirectional.center,
////                                child: Icon(Icons.location_on),
////                              ),
////                              SizedBox(
////                                width: 5.0,
////                              ),
////                              Container(
////                                alignment: AlignmentDirectional.center,
////                                child: Text(
////                                  'Mumbai, Maharashtra',
////                                  style: TextStyle(
////                                    fontSize: 15.0,
////                                  ),
////                                ),
////                              ),
////                            ],
////                          ),
////                        ),
////                        Container(
//////                          color: Colors.white,
////                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
////                          child: TextField(
////                            decoration: InputDecoration(
////                              prefixIcon: Icon(Icons.search),
////                              hintText: 'Search',
////                            ),
////                          ),
////                        ),
////                        SizedBox(
////                          height: 20.0,
////                        )
////                      ],
////                    ),
////                  ),
//
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return DineOut();
//                                  }));
//                            },
//                            child: Container(
//                              width: 110.0,
//                            height: 145,
//                            decoration: BoxDecoration(
//                              borderRadius:  BorderRadius.circular(20.0),
//                                image: DecorationImage(
//                                    image: AssetImage('assets/Dine_out.png'),
//                                    fit: BoxFit.cover),
//                            ),
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.restaurant,
////                                        size: 75.0,
////                                        color: Colors.white,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Dineout',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                          fontWeight: FontWeight.bold
//                                        ),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '10+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 20.0,),
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return Booking();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Booking.png'),
//                                      fit: BoxFit.cover),
//                                ),
//
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.calendar_today,
////                                        size: 75.0,
////                                        color: Colors.white,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Booking',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                        fontWeight: FontWeight.bold
//                                        ),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '9+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 20.0,),
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return TopRated();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Top_Rated.png'),
//                                      fit: BoxFit.cover),
//                                ),
//                                child: Center(
//                                    child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: <Widget>[
////                                        Container(
////                                          padding: EdgeInsets.only(top: 20.0),
////                                          child: Icon(
////                                            Icons.stars,
////                                            size: 75.0,
////                                            color: Colors.yellow,
////                                          ),
////                                        ),
//                                        Container(
//                                          child: Text(
//                                            'Top Rated',
//                                            style: TextStyle(
//                                                fontSize: 17.0,
//                                                color: Colors.white,
//                                              fontWeight: FontWeight.bold
//                                            ),
//                                          ),
//                                        ),
//                                        Container(
//                                            child: Text(
//                                              '5+ Options',
//                                              style: TextStyle(color: Colors.white),
//                                            )),
//                                        SizedBox(
//                                          height: 8.0,
//                                        )
//                                      ],
//                                    ))),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Padding(
//                      padding: const EdgeInsets.all(12.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return PickUp();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Pickup.png'),
//                                      fit: BoxFit.cover),
//                                ),
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.location_on,
////                                        size: 75.0,
////                                        color: Colors.green,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Pick Up',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                        fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '12+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 75,),
//                          FlatButton(onPressed: null, child: null),
//                          SizedBox(width: 30,),
//                          FlatButton(onPressed: null, child: null)
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    alignment: Alignment.centerLeft,
//                    child: Container(
////                        width: 175.0,
////                        margin: EdgeInsets.all(10.0),
////                        decoration: BoxDecoration(
////                          border: Border.all(color: Colors.black),
//////                          color: Colors.blue[200],
////                        ),
//                      child: Padding(
//                        padding: const EdgeInsets.all(5.0),
//                        child: Text(
//                          'Top Restaurants :',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              fontSize: 20.0,
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                    ),
//                  )
//                ]),
//              Padding(
//                  padding: EdgeInsets.only(top: 15.0),
//                  child: GestureDetector(
//                    onTap: (){
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) {
//                            return HomePage();
//                          }));
//                    },
//                    child: Card(
//                      elevation: 1.0,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(10.0)
//                        ),
//                        child: Row(
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.all(10.0),
//                              child: Container(
//                                alignment: Alignment.centerLeft,
//                                height: 80,
//                                width: 80.0,
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/${rest[index].image}'),
//                                      fit: BoxFit.cover),
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.all(20.0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      alignment: Alignment.centerLeft,
//                                      child: Text(rest[index].name,
//                                      style: TextStyle(
//                                        fontSize: 22.0,
//                                        fontWeight: FontWeight.bold
//                                      ),),
//                                    ),
//                                    Container(
//                                        alignment: Alignment.centerLeft,
//                                        child: Text('\u{02605}4.2')),
//                                    SizedBox(height: 5.0,),
//                                    Text(rest[index].desc),
//
//
//                                  ],
//                                ),
//                              ),
//                            )
//                          ],
//                        )
//                    ),
//                  )),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}
//
//class _Restaurants {
//  String image;
//  String name;
//  String desc;
//
//  _Restaurants({this.image, this.name, this.desc});
//}

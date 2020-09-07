import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';

class PickUp extends StatefulWidget {
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  List<_Restaurants> rest = [
    _Restaurants(
        image: 'bombayvintage.png',
        image1: 'bombayvintage1.png',
        image2: 'bombayvintage2.png',
        name: 'Bombay Vintage',
        desc:
            '\u27A4 Casual Dining, Bar - North Indian, South Indian, Maharashtrian\n\u2691 Colaba'),
    _Restaurants(
        image: 'jamjar.png',
        image1: 'jamjar1.png',
        image2: 'jamjar2.png',
        name: 'JamJar Diner',
        desc:
            '\u27A4 Casual Dining, Bar - American, Italian, Mexican, Healthy Food, Burger, Salad, Beverages\n\u2691 Hill Road, Bandra West'),
    _Restaurants(
        image: 'mabruk.png',
        image1: 'mabruk1.png',
        image2: 'mabruk2.png',
        name: 'Mabruk- Sahara Star',
        desc:
            '\u27A4 Fine Dining - Lebanese, Mediterranean \n\u2691 Vile Parle East'),
    _Restaurants(
        image: 'masque.png',
        image1: 'masque1.png',
        image2: 'masque2.png',
        name: 'Masque',
        desc: '\u27A4 Fine Dining - Modern Indian\n\u2691 Mahalaxmi'),
    _Restaurants(
        image: 'kfc.png',
        image1: 'kfc1.png',
        image2: 'kfc2.png',
        name: 'KFC',
        desc:
            '\u27A4 Quick Bites - Burger, Fast Food, Finger Food, Beverages\n\u2691 Linking Road, Bandra West'),
    _Restaurants(
        image: 'mexichino.png',
        image1: 'mexichino1.png',
        image2: 'mexichino2.png',
        name: 'MexiChino',
        desc:
            '\u27A4 Casual Dining - Mexican, Chinese, Continental\n\u2691 Borivali West'),
    _Restaurants(
        image: 'rabdiwala.png',
        image1: 'rabdiwala1.png',
        image2: 'rabdiwala2.png',
        name: 'RabdiWala',
        desc:
            '\u27A4 Casual Dining, Dessert Parlor - Rajasthani, Gujarati, Mithai, Desserts, Maharashtrian\n\u2691 Borivali West'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: rest.length,
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (index == 0)
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          SizedBox(height: 5.0,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              autocorrect: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Where do you want to go?',
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.location_on),
                                Text('Mumbai,Maharashtra')
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                left: 30.0,
                                right: 30.0,
                                bottom: 10.0),
                            child: Container(
                              height: 180,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/Pickup.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Pick Up',
                                      style: TextStyle(
                                          fontSize: 30.0,fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    '12+ Options',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Container(
//                                width: 175.0,
//                                margin: EdgeInsets.all(10.0),
//                                decoration: BoxDecoration(
//                                    border:
//                                        Border.all(color: Colors.transparent),
//                                    color: Colors.red[200]),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Top Restaurants :',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ]),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return HomePage(desc: rest[index].desc,imgName: rest[index].image,imgName1: rest[index].image1,imgName2: rest[index].image2,restName: rest[index].name,);
                      }));
                    },
                    child: Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 100,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${rest[index].image}'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        rest[index].name,
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text('\u{02605}4.2')),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(rest[index].desc)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ]);
          }),
    ));
  }
}

class _Restaurants {
  String image;
  String name;
  String desc;
  String image1;
  String image2;

  _Restaurants({this.image, this.name, this.desc,this.image1,this.image2});
}

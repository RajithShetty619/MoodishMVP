import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';

class TopRated extends StatefulWidget {
  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  List<_Restaurants> rest = [
    _Restaurants(
        image: 'bayview.png',
        image1: 'bayview1.png',
        image2: 'bayview2.png',
        name: 'Bay View',
        desc:
        'Casual Dining - Seafood, North Indian, Chinese\nBorivali West'),
    _Restaurants(
        image: 'canto.png',
        image1: 'canto1.png',
        image2: 'canto2.png',
        name: 'Canto- Resto & Bar',
        desc:
        'Casual Dining, Bar - North Indian, Continental, Italian, Lebanese\nLower Parel'),
    _Restaurants(
        image: 'quessoristorante.png',
        image1: 'quessoristorante1.png',
        image2: 'quessoristorante2.png',
        name: 'Quesso Ristorante',
        desc:
        'Casual Dining, Bar - Continental, Mexican, Italian, Mediterranean, Thai, Desserts\nOshiwara, Andheri West'),
    _Restaurants(
        image: 'burgerbrasserie.png',
        image1: 'burgerbrasserie1.png',
        image2: 'burgerbrasserie2.png',
        name: 'Burger Brasserie',
        desc:
        'Quick Bites - Burger, Fast Food, Beverages \nAndheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'blackolive.png',
        image1: 'blackolive1.png',
        image2: 'blackolive2.png',
        name: 'Black Olive',
        desc: 'Healthy Food, Continental, Italian \nOshiwara, Andheri West'),
    _Restaurants(
        image: 'sevenkitchen.png',
        image1: 'sevenkitchen1.png',
        image2: 'sevenkitchen2.png',
        name: 'Seven Kitchen',
        desc:
        'Fine Dining - Chinese, North Indian, Italian, European, Desserts \nLower Parel'),
    _Restaurants(
        image: 'sincity.png',
        image1: 'sincity1.png',
        image2: 'sincity2.png',
        name: 'Sin City',
        desc:
        'Bar, Casual Dining - Continental, North Indian, Thai, Italian \nAndheri Lokhandwala, Andheri West'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.builder(
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
                                padding: EdgeInsets.only(top: 10.0,left: 30.0,right: 30.0,bottom: 10.0),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                        image: AssetImage('assets/Top_Rated.png'),
                                        fit: BoxFit.cover),                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 5.0,),
                                      Container(
                                        child: Icon(
                                          Icons.stars,
                                          size: 75.0,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Top Rated',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                            '5+ Options',
                                            style:
                                            TextStyle(color: Colors.white),
                                          )),
                                      SizedBox(height: 10.0,)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Container(
//                                    width: 175.0,
//                                    margin: EdgeInsets.all(10.0),
//                                    decoration: BoxDecoration(
//                                        border: Border.all(color: Colors.transparent),
//                                        color: Colors.orange[200]
//                                    ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Top Restaurants :',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: GestureDetector(
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
                                        height: 80,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
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
                                            Text(rest[index].desc),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          )),
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

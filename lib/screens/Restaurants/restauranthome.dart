import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'file:///C:/Users/varun/MoodishMVP/lib/screens/Restaurants/restaurantCard/restCardModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restCategoryModel.dart';

class RestaurantHome extends StatefulWidget {
  @override
  _RestaurantHomeState createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  double _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MainPainter(),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your Address',
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                      Text.rich(TextSpan(
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                                text: 'Mumbai,Maharashtra west ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            WidgetSpan(
                                child: Icon(
                              Icons.edit,
                              size: 17,
                            ))
                          ]))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15, top: 10),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.search,
                        size: 32,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                autoPlay: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index.toDouble();
                  });
                },
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                scrollPhysics: BouncingScrollPhysics(),
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RestCardModel();
                          }));
                    },
                    child: Container(
                      height: 215,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage('assets/Coffee.jpg'),
                              fit: BoxFit.cover)),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Container(
                            height: 95,
                            width: 240,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Yauatcha',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0, top: 1),
                                    child: Text(
                                      'Fine Dining,Cantonese,Chinese',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey[400]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, bottom: 2),
                                    child: Divider(
                                      thickness: 1.2,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '4.5(289)',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.alarm,
                                            size: 10,
                                          ),
                                          Text(
                                            '15-20 mins',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\u20B9 Free',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 25,
            ),
            DotsIndicator(
              dotsCount: 5,
              position: _currentIndex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                color: Colors.black,
                spacing: EdgeInsets.all(4),
                activeColor: Colors.orange[400],
                activeSize: Size(12, 12),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RestCategoryModel(event:1,);
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.restaurant_menu,
                              size: 45,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Fine Dining')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RestCategoryModel(event:2,);
                          }));
                    },
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/italianIcon.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Italian')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RestCategoryModel(event:3,);
                          }));
                    },
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/continentalIcon.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Continental')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RestCategoryModel(event:4,);
                          }));
                    },
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/dessetIcon.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Desserts')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RestCategoryModel(event:5,);
                          }));
                    },
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/fastfoodIcon.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Fast Food')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1.2,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 10, bottom: 20),
              child: Text(
                'What do you plan to do?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Container(
                        height: 175,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Dine out',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 200),
                              child: Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                    'Get food home from selected restaurants'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      color: Colors.yellow[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Container(
                        height: 175,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Pick Up Order',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 200),
                              child: Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                    'In the area? PLace your order and self-pick up while going home'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      color: Colors.red[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Container(
                        height: 175,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Order In',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 200),
                              child: Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                    'Get food home delivered from selected restaurants'),
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'All Restaurants',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sorted by Near You',
                        style: TextStyle(color: Colors.grey[300]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15, top: 8),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.tune,
                          size: 24,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                        right: MediaQuery.of(context).size.width / 15,
                        top: 5,
                        bottom: 5),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return RestCardModel();
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Yauatcha',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        width: 170,
                                        child: Text(
                                          'Fine Dining, Cantonese, Chinese',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[300]),
                                        )),
                                    Text(
                                      'Mumbai Maharashtra',
                                      style: TextStyle(
                                          color: Colors.grey[300], fontSize: 11),
                                    ),
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
                                          Icons.star,
                                          size: 10,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          '4.5(289)',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.alarm,
                                          size: 10,
                                        ),
                                        Text(
                                          '15-20 mins',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '\u20B9 Free',
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage('assets/Coffee.jpg'),
                                          fit: BoxFit.cover)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class MainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path topCircular = Path();
    Paint paint = Paint();
    paint.color = Colors.orange.shade200;
    final height = size.height;
    final width = size.width;
    topCircular.moveTo(-150, -20);
    topCircular.quadraticBezierTo(
        width * 0.501, height * 0.6, width + 150, -20);
    topCircular.close();
    canvas.drawPath(topCircular, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

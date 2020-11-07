import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restCardModel.dart';

class RestCategoryModel extends StatefulWidget {
  int event;

  RestCategoryModel({this.event});

  @override
  _RestCategoryModelState createState() => _RestCategoryModelState();
}

class _RestCategoryModelState extends State<RestCategoryModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: MainPainter(),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 32, 10, 0),
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
                                TextSpan(text: 'Mumbai,Maharashtra west '),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.edit,
                                  size: 17,
                                ))
                              ]))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.arrow_back,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.search,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 85,
              ),
              Center(
                child: widget.event == 1
                    ? Text(
                        'Fine Dining',
                        style: TextStyle(fontSize: 20),
                      )
                    : widget.event == 2
                        ? Text(
                            'Italian',
                            style: TextStyle(fontSize: 20),
                          )
                        : widget.event == 3
                            ? Text(
                                'Continental',
                                style: TextStyle(fontSize: 20),
                              )
                            : widget.event == 4
                                ? Text(
                                    'Desserts',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : widget.event == 5
                                    ? Text(
                                        'Fast Food',
                                        style: TextStyle(fontSize: 20),
                                      )
                                    : null,
              ),
              SizedBox(
                height: 16,
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
                        onTap: () {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: Colors.grey[300],
                                            fontSize: 11),
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
                                            image:
                                                AssetImage('assets/Coffee.jpg'),
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
    topCircular.moveTo(-128, -65);
    topCircular.quadraticBezierTo(
        width * 0.501, height * 0.5, width + 128, -65);
    topCircular.close();
    canvas.drawPath(topCircular, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

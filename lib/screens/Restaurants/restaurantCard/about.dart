import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  final Widget child;

  About({Key key, this.child}) : super(key: key);

  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<String> items = [
    'Best Known For :',
    'Cuisines Served :',
    'Hygiene :',
    'Offers :'
  ];
  List<String> nutri = ['Carbs.png', 'Protien.png', 'Fats.png', 'Sugar.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              if (index == 0)
                Stack(
                  children: <Widget>[
                    Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text("+91-01237-12372"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("Call"),
                                              onPressed: () {},
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Tab(
                                    icon: Icon(
                                      Icons.call,
                                      size: 70,
                                    ),
                                    child: Text("Phone"))),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          content: Column(
                                            children: [
                                              SingleChildScrollView(
                                                child: Container(
                                                  height: 100.0,
                                                  width: 200.0,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Text("Today/'s Offers"),
                                                      //SizedBox(height: 50),
                                                      // Text("Today/'s Offers"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(""),
                                              onPressed: () {},
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Tab(
                                    icon: Icon(
                                      Icons.local_offer,
                                      size: 70,
                                    ),
                                    child: Text("Offers"))),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (Builder) {
                                        return Container(
                                          height: 900.0,
                                          color: Colors.blue,
                                          child: Scaffold(
                                              appBar: AppBar(
                                            backgroundColor: Colors.white,
                                            title: TextField(
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.search),
                                                  hintText: "Search here"),
                                            ),
                                            actions: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.search,
                                                ),
                                                onPressed: () {},
                                              )
                                            ],
                                          )),
                                        );
                                      });
                                },
                                child: Tab(
                                    icon: Icon(
                                      Icons.restaurant_menu,
                                      size: 70,
                                    ),
                                    child: Text("Menu"))),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (Builder) {
                                        return Container(
                                            height: 900.0,
                                            color: Colors.white,
                                            child: new Text(
                                              "Share",
                                              style: TextStyle(
                                                fontSize: 50,
                                              ),
                                              textAlign: TextAlign.left,
                                            ));
                                      });
                                },
                                child: Tab(
                                  icon: Icon(
                                    Icons.share,
                                    size: 70,
                                  ),
                                  child: Text("Share"),
                                )),
                            SizedBox(
                              width: 20.0,
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 160, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                  "afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nutrients',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage('assets/${nutri[0]}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7.0,),
                                      Text('27% Carbs')
                                    ],
                                  ),
                                  SizedBox(width: 20.0,),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage('assets/${nutri[1]}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7.0,),
                                      Text('36% Protien')
                                    ],
                                  ),
                                  SizedBox(width: 20.0,),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage('assets/${nutri[2]}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7.0,),
                                      Text('14% Fats')
                                    ],
                                  ),
                                  SizedBox(width: 20.0,),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 80.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage('assets/${nutri[3]}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7.0,),
                                      Text('23% Sugar')
                                    ],
                                  ),
                                  SizedBox(width: 20.0,),



                                ],
                              ),
                          ),
                          SizedBox(height: 10.0,),

                        ],
                      ),
                    )
                  ],
                ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          items[index],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                Text('1/2 Cup Milk')
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

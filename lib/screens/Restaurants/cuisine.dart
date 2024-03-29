import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/Restaurants/taste.dart';
import 'package:hive/hive.dart';
import 'prefVegNveg.dart';

class Cuisine extends StatefulWidget {
  int event;
  Cuisine({this.event});
  @override
  _CuisineState createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
//  @override
//  void initState()async{
//    super.initState();
//    box = await Hive.openBox('preferenceBox');
//  }

  List<GridTileBuilder> cuisine = [
    GridTileBuilder(
        image: 'NorthIndian.jpeg', cuisine: 'Indian', isSelected: false),
    GridTileBuilder(
        image: 'frenchCuisine.jpg', cuisine: 'French', isSelected: false),
    GridTileBuilder(
        image: 'Chinese.png', cuisine: 'Chinese', isSelected: false),
    GridTileBuilder(
        image: 'spanishCuisine.jpg', cuisine: 'Spanish', isSelected: false),
    GridTileBuilder(
        image: 'FastFood.png', cuisine: 'American', isSelected: false),
    GridTileBuilder(
        image: 'japaneseCuisine.jpg', cuisine: 'Japanese', isSelected: false),
    GridTileBuilder(
        image: 'Italian.jpg', cuisine: 'Italian', isSelected: false),
    GridTileBuilder(
        image: 'Mexican.jpg', cuisine: 'Mexican', isSelected: false),
    GridTileBuilder(
        image: 'britishCuisine.jpg', cuisine: 'British', isSelected: false),
  ];

  int i = 0;
  List<String> pref = []; //all the user preferences are saved here
  String err = '';
  bool _visible = true;
  bool isSelected = false;
  List<dynamic> cuisinePref = Hive.box('preferenceBox').get('preference');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Which Cuisines would you prefer?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please select any 5, We will personalise the app for you ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 1.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: cuisine.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          print("pressesesesesesd5362");
                          dynamic _val = cuisine[index];

                          setState(() {
                            if (cuisine[index].isSelected == true) {
                              pref.remove(cuisine[index].cuisine);
                              i--;
                            }
                            if (cuisine[index].isSelected == false) {
                              pref.add(_val.cuisine);
                              i++;
                            }
                            print(i);
                            print(pref);
                            print(pref.contains(_val.cuisine));
                          });
                          setState(() {
                            cuisine[index].isSelected =
                                !cuisine[index].isSelected;
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: cuisine[index].isSelected
                                    ? Border.all(color: Colors.orange, width: 2)
                                    : Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(250),
                              ),
                              child: Center(
                                  child: cuisine[index].isSelected
                                      ? Text(
                                          '${cuisine[index].cuisine}',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text('${cuisine[index].cuisine}'))),
                        ),
                      );
                    }),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: widget.event == 1
                          ? Text(
                              "Previously Selected:-${cuisinePref.join(',')}\ndon't worry, You can change this later! ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            )
                          : Text(
                              "don't worry, You can change this later! ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: (i + 1 > 3)
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Text(''),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    err,
                                    style: TextStyle(color: Colors.red),
                                  ))),
                      widget.event == 1
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () async {
                                  print(i);
                                  if (i + 1 > 3) {
                                    Box box =
                                        await Hive.openBox('preferenceBox');
                                    box.put('preference', pref);
                                    DatabaseService().savePreference();
                                    Navigator.of(context).pop(pref);
                                  } else
                                    setState(() {
                                      err = 'Select ${3 - i} more!';
                                    });
                                },
                                // color: Colors.green,
                                child: Container(
                                  width: 100,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.blue[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Change',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () async {
                                  if (i + 1 > 3) {
                                    Box box =
                                        await Hive.openBox('preferenceBox');
                                    box.put('preference', pref);
                                    DatabaseService().savePreference();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return FoodPreference();
                                    }));
                                  } else
                                    setState(() {
                                      err = 'Select ${3 - i} more!';
                                      print(i);
                                    });
                                },
                                child: Container(
                                  width: 100,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.blue[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridTileBuilder {
  String image;
  String cuisine;
  bool isSelected;
  GridTileBuilder({this.cuisine, this.image, this.isSelected});
}

class cuisineFilter extends StatefulWidget {
  final String name;

  cuisineFilter({Key key, this.name}) : super(key: key);

  @override
  _cuisineFilterState createState() => _cuisineFilterState();
}

class _cuisineFilterState extends State<cuisineFilter> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("pressesesesesesd5362");
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: Colors.orange, width: 2)
                  : Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(250),
            ),
            child: Center(
                child: isSelected
                    ? Text(
                        widget.name,
                        style: TextStyle(color: Colors.orange),
                      )
                    : Text(widget.name))),
      ),
    );
    //  FilterChip(
    //   label: ClipRRect(
    //     borderRadius: BorderRadius.circular(20),
    //     child: Container(
    //       margin: EdgeInsets.all(8),
    //       decoration: BoxDecoration(
    //         border:isSelected? Border.all(color: Colors.black, width: 2) : Border.all(color: Colors.deepOrange, width: 2),
    //         borderRadius: BorderRadius.circular(300),
    //       ),
    //       child: Text(widget.name),
    //     ),
    //   ),
    //   backgroundColor: Colors.blue[400],
    //   onSelected: (selected){
    //     setState(() {
    //       isSelected = selected;
    //     });
    //   }
    // );
  }
}

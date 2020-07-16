import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class RecipeTab extends StatefulWidget {
  @override
  _RecipeTabState createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  List<RecipeCard> _info = [
    RecipeCard(
        image: 'Salty.jpg',
        title: 'Chips n Salt',
        cuisine: 'Indian-Cheap-10 mins',
        name: 'Name')
  ];

  @override
  Widget build(BuildContext context) {
    return getListview(info: _info);
  }
}

class getListview extends StatelessWidget {
  const getListview({
    Key key,
    @required List<RecipeCard> info,
  })  : _info = info,
        super(key: key);

  final List<RecipeCard> _info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
          child: Column(
            children: <Widget>[
              Container(
                height: 300.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                      image: AssetImage('assets/${_info[0].image}'),
                      fit: BoxFit.cover),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _info[0].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(_info[0].cuisine)),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(_info[0].name)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(300),
                          ),
                          // color: Colors.blue[300],
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Food_Info()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard {
  String image;
  String title;
  String cuisine;
  String name;

  RecipeCard({this.image, this.title, this.cuisine, this.name});
}

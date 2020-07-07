import 'package:flutter/material.dart';

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
    return  getListview(info: _info);
  }
}

class getListview extends StatelessWidget {
  const getListview({
    Key key,
    @required List<RecipeCard> info,
  }) : _info = info, super(key: key);

  final List<RecipeCard> _info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10.0),
      child: GestureDetector(
        onTap: (){},
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)),
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
                padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(_info[0].name)),
              ),
              SizedBox(
                height: 30,
              )
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

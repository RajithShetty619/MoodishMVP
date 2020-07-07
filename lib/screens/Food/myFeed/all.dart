import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/myFeed/polls.dart';
import 'package:moodish_mvp/screens/Food/myFeed/recipe.dart';

class AllTabs extends StatefulWidget {
  @override
  _AllTabsState createState() => _AllTabsState();
}

class _AllTabsState extends State<AllTabs> {
  List<AllCard> _info =[
    AllCard(image: 'Salty.jpg',title: 'Chips',cuisine: 'Indian-Cheap-10 mins',name: 'Name')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          
          child: SingleChildScrollView
            (scrollDirection: Axis.horizontal,
                child: RecipeListView(info: _info)
              ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context , index){
                return PollListView(info: _info);
              }),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context , index){
                return Card(
                  child: Container(
                    height: 150.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                            image: AssetImage('assets/${_info[0].image}')
                        )
                    ),

                  ),
                );
              }),
        )
      ],
    );
  }
}

class PollListView extends StatelessWidget {
  const PollListView({
    Key key,
    @required List<AllCard> info,
  }) : _info = info, super(key: key);

  final List<AllCard> _info;

  @override
  Widget build(BuildContext context) {
    return PollTabs();
    
  }
}

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    Key key,
    @required List<AllCard> info,
  }) : _info = info, super(key: key);

  final List<AllCard> _info;

  @override
  Widget build(BuildContext context) {
    return RecipeTab();
  }
}

class AllCard{
  String image;
  String title;
  String cuisine;
  String name;
  AllCard({this.image,this.title,this.cuisine,this.name});
}
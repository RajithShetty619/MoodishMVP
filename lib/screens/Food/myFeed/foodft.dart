import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/factsModel.dart';

class FoodftTab extends StatefulWidget {
  @override
  _FoodftTabState createState() => _FoodftTabState();
}

class _FoodftTabState extends State<FoodftTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FactModel>>(
        future: DatabaseQuery().getFact(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<FactModel> _fact = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _fact.length,
                itemBuilder: (BuildContext context, int index) {
                  return getListView(
                    fact: _fact[index],
                  );
                });
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.greenAccent[400],
                size: 40,
              ),
            );
          }
        });
  }
}

class getListView extends StatefulWidget {
  final FactModel fact;
  getListView({
    this.fact,
    Key key,
  }) : super(key: key);

  @override
  _getListViewState createState() => _getListViewState();
}

class _getListViewState extends State<getListView> {
  bool _like = true;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.fact.factHeading,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.fact.factStatment,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: _like
                      ? Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 30,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red[700],
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      _like = !_like;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.swap_horizontal_circle,
                    size: 25,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ));
  }
}

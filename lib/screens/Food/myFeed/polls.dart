import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/pollsModel.dart';

class PollTabs extends StatefulWidget {
  @override
  _PollTabsState createState() => _PollTabsState();
}

class _PollTabsState extends State<PollTabs> {
  @override
  Widget build(BuildContext context) {
    /* used to get polls from the database */
    return FutureBuilder<List<PollsModel>>(
      future: DatabaseQuery().getPoll(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<PollsModel> _pollList = snapshot.data;
          return ListView.builder(
            itemCount: _pollList.length,
            itemBuilder: (BuildContext context, int index) {
              return getListView( 
                poll: _pollList[index]
              );
            },
          );
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 40,
            ),
          );
        }
      },
    );
  }
}

/* poll card displayin widget */
class getListView extends StatefulWidget {
 
  final PollsModel poll ;
  getListView({ 
    this.poll,
    Key key,
  }) : super(key: key);

  @override
  _getListViewState createState() => _getListViewState();
}

class _getListViewState extends State<getListView> {

  int _index;
  bool pollPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.poll.question??'',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {if(!pollPressed){
              
            }},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      widget.poll.A??'',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      widget.poll.B??'',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      widget.poll.C??'',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      widget.poll.D??'',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

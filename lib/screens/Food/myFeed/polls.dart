import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/models/this_thatModel.dart';
import 'package:moodish_mvp/models/yesNo.dart';

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
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _pollList.length,
            itemBuilder: (BuildContext context, int index) {
              return getListView(poll: _pollList[index]);
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

class This_ThatTabs extends StatefulWidget {
  @override
  _This_ThatTabsState createState() => _This_ThatTabsState();
}

class _This_ThatTabsState extends State<This_ThatTabs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<This_thatModel>>(
        future: DatabaseQuery().getthis_that(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<This_thatModel> _thisthat = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _thisthat.length,
                itemBuilder: (BuildContext context, int index) {
                  return GetListView(
                    this_that: _thisthat[index],
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

class YesNoTabs extends StatefulWidget {
  @override
  _YesNoTabsState createState() => _YesNoTabsState();
}

class _YesNoTabsState extends State<YesNoTabs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YesNoModel>>(
        future: DatabaseQuery().getYesno(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<YesNoModel> _yesno = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _yesno.length,
                itemBuilder: (BuildContext context, int index) {
                  return YesNoList(
                    yesno: _yesno[index],
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

class YesNoList extends StatefulWidget {
  final YesNoModel yesno;

  const YesNoList({Key key, this.yesno}) : super(key: key);
  @override
  _YesNoListState createState() => _YesNoListState();
}

class _YesNoListState extends State<YesNoList> {
  int _index;
  bool _pressed = false;
  YesNoModel _yes;

  @override
  void initState() {
    setState(() {
      _yes = widget.yesno;
    });
    super.initState();
  }

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
                widget.yesno.Questions ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!_pressed) {
                await DatabaseService().likeTransction(
                    collection: 'yesorno', sr_no: _yes.sr_no, field: 'yes');
                setState(() {
                  _index = 1;
                  ++_yes.yes;
                  _pressed = true;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 1 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "    Yes",
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        " ${_yes.yes}   ",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!_pressed) {
                await DatabaseService().likeTransction(
                    collection: 'yesorno', sr_no: _yes.sr_no, field: 'no');
                setState(() {
                  _index = 2;
                  ++_yes.no;
                  _pressed = true;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 2 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "    No",
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        " ${_yes.no}   ",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// print this that on the screen
class GetListView extends StatefulWidget {
  final This_thatModel this_that;
  GetListView({
    this.this_that,
    Key key,
  }) : super(key: key);

  @override
  _GetListViewState createState() => _GetListViewState();
}

class _GetListViewState extends State<GetListView> {
  int _index;
  bool thispressed = false;
  This_thatModel _thisT;
  @override
  void initState() {
    setState(() {
      _thisT = widget.this_that;
    });
    super.initState();
  }

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
                'Which one would You prefer?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!thispressed) {
                setState(() {
                  _index = 1;
                  ++_thisT.aLike;
                  thispressed = true;
                });
                await DatabaseService().likeTransction(
                    collection: 'this_that',
                    sr_no: _thisT.sr_no,
                    field: 'aLike');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 1 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_thisT.A ?? '') + " ${_thisT.aLike}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!thispressed) {
                setState(() {
                  _index = 2;
                  thispressed = true;
                  ++_thisT.bLike;
                });
                await DatabaseService().likeTransction(
                    collection: 'this_that',
                    sr_no: _thisT.sr_no,
                    field: 'bLike');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 2 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_thisT.B ?? '') + " ${_thisT.bLike}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* poll card displayin widget */
class getListView extends StatefulWidget {
  final PollsModel poll;
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
  PollsModel _poll;

  @override
  void initState() {
    setState(() {
      _poll = widget.poll;
    });
    super.initState();
  }

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
                _poll.question ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!pollPressed) {
                setState(() {
                  _index = 1;
                   pollPressed=true;
                  ++_poll.aLike;
                });
                await DatabaseService().likeTransction(
                    collection: 'polls', sr_no: _poll.sr_no, field: 'aLike');
              
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 1 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_poll.A ?? '') + " ${_poll.aLike}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!pollPressed) {
                setState(() {
                  _index = 2;
                  pollPressed = true;
                  ++_poll.bLike;
                });
                await DatabaseService().likeTransction(
                    collection: 'polls', sr_no: _poll.sr_no, field: "bLike");
                ;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 2 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_poll.B ?? '') + " ${_poll.bLike}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!pollPressed) {
                setState(() {
                  _index = 3;
                  pollPressed = true;
                  ++_poll.cLike;
                });
                await DatabaseService().likeTransction(
                    collection: 'polls', sr_no: _poll.sr_no, field: 'cLike');
                
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 3 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_poll.C ?? '') + " ${_poll.cLike}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!pollPressed) {
                setState(() {
                  _index = 4;
                  pollPressed = true;
                  ++_poll.dLike;
                });
                await DatabaseService().likeTransction(
                    collection: 'polls', sr_no: _poll.sr_no, field: 'dLike');
                
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: _index == 4 ? Colors.blueAccent : Colors.black12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      (_poll.D ?? '') + " ${_poll.dLike}",
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

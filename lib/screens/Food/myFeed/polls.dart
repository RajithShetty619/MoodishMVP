import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/models/this_thatModel.dart';
import 'package:moodish_mvp/models/yesNo.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBloc.dart';
import 'package:moodish_mvp/screens/Food/events/pollsEvent.dart';
import 'package:polls/polls.dart';

class PollTabs extends StatefulWidget {
  @override
  _PollTabsState createState() => _PollTabsState();
}

class _PollTabsState extends State<PollTabs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* used to get polls from the database */
    return BlocConsumer<PollBloc, Map<String, List<dynamic>>>(
      buildWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        return true;
      },
      listenWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        // if (current.length > previous.length) {
        //   return true;
        // }
        return true;
      },
      builder: (BuildContext context, pollList) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pollList['p'].length,
          itemBuilder: (BuildContext context, index) {
            return GetListView1(
                poll: pollList['p'][index],
                choice: pollList['choice'],
                index: index);
          },
        );
      },
      listener: (context, pollList) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Added!')),
        );
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
    return BlocConsumer<PollBloc, Map<String, List<dynamic>>>(
      buildWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        return true;
      },
      listenWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        return true;
      },
      builder: (BuildContext context, thislist) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: thislist['tt'].length,
          itemBuilder: (BuildContext context, index) {
            return GetListView(
                this_that: thislist['tt'][index],
                choice: thislist['choice'],
                index: index);
          },
        );
      },
      listener: (context, thislist) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Added!')),
        );
      },
    );
  }
}

class YesNoTabs extends StatefulWidget {
  @override
  _YesNoTabsState createState() => _YesNoTabsState();
}

class _YesNoTabsState extends State<YesNoTabs> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PollBloc, Map<String, List<dynamic>>>(
      buildWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        return true;
      },
      listenWhen: (Map<String, List<dynamic>> previous,
          Map<String, List<dynamic>> current) {
        // if (current.length > previous.length) {
        //   return true;
        // }
        return true;
      },
      builder: (BuildContext context, yesno) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: yesno['yn'].length,
          itemBuilder: (BuildContext context, index) {
            return YesNoList(
                yesno: yesno['yn'][index],
                choice: yesno['choice'],
                index: index);
          },
        );
      },
      listener: (context, yesno) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Added!')),
        );
      },
    );
  }
}

class YesNoList extends StatefulWidget {
  final YesNoModel yesno;
  final List<dynamic> choice;
  final int index;

  const YesNoList({Key key, this.yesno, this.choice, this.index});
  @override
  _YesNoListState createState() => _YesNoListState();
}

class _YesNoListState extends State<YesNoList> {
  bool _pressed = false;
  YesNoModel _yes;
  Map usersWhoVoted = {};

  @override
  void initState() {
    setState(() {
      _yes = widget.yesno;
      if (widget.choice[widget.index] != 0)
        usersWhoVoted['you'] = widget.choice[widget.index];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Polls(
          children: [
            // This cannot be less than 2, else will throw an exception
            Polls.options(title: 'Yes', value: (_yes.yes * 1.0)),
            Polls.options(title: 'No', value: (_yes.no * 1.0)),
          ],
          question: Text(
            widget.yesno.Questions ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          currentUser: 'you',
          creatorID: 'snapinsight',
          voteData: usersWhoVoted,
          userChoice: usersWhoVoted['you'],
          onVoteBackgroundColor: Colors.blue,
          leadingBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          onVote: (choice) async {
            setState(() {
              BlocProvider.of<PollBloc>(context)
                  .add(PollEvent.replace(widget.index, choice));
              usersWhoVoted['you'] = choice;
            });
            if (choice == 1) {
              setState(() {
                _yes.yes += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'yesorno', sr_no: _yes.sr_no, field: 'yes');
            }
            if (choice == 2) {
              setState(() {
                _yes.no += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'yesorno', sr_no: _yes.sr_no, field: 'no');
            }
          },
        ),
      ),
    );
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: 8.0,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: Text(
    //             widget.yesno.Questions ?? '',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!_pressed) {
    //              setState(() {
    //               _index = 1;
    //               ++_yes.yes;
    //               _pressed = true;
    //             });
    //             await DatabaseService().likeTransction(collection: 'yesorno',sr_no: _yes.sr_no, field: 'yes');

    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 1 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Align(
    //                   alignment: Alignment.center,
    //                   child: Padding(
    //                     padding: EdgeInsets.all(5.0),
    //                     child: Text(
    //                       "    Yes",
    //                       style: TextStyle(fontSize: 22.0),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.all(5.0),
    //                   child: Text(
    //                     " ${_yes.yes}   ",
    //                     style: TextStyle(fontSize: 22.0),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!_pressed) {
    //             setState(() {
    //               _index = 2;
    //               ++_yes.no;
    //               _pressed = true;
    //             });
    //             await DatabaseService().likeTransction(
    //                 collection: 'yesorno', sr_no: _yes.sr_no, field: 'no');

    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 2 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Align(
    //                   alignment: Alignment.center,
    //                   child: Padding(
    //                     padding: EdgeInsets.all(5.0),
    //                     child: Text(
    //                       "    No",
    //                       style: TextStyle(fontSize: 22.0),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.all(5.0),
    //                   child: Text(
    //                     " ${_yes.no}   ",
    //                     style: TextStyle(fontSize: 22.0),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// print this that on the screen
class GetListView extends StatefulWidget {
  final This_thatModel this_that;
  final List<dynamic> choice;
  final int index;
  GetListView({
    Key key,
    this.this_that,
    this.choice,
    this.index,
  });

  @override
  _GetListViewState createState() => _GetListViewState();
}

class _GetListViewState extends State<GetListView> {
  bool thispressed = false;
  This_thatModel _thisT;
  Map usersWhoVoted = {};
  @override
  void initState() {
    setState(() {
      _thisT = widget.this_that;

      if (widget.choice[widget.index] != 0)
        usersWhoVoted['you'] = widget.choice[widget.index];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Polls(
          children: [
            // This cannot be less than 2, else will throw an exception
            Polls.options(title: _thisT.A ?? '', value: (_thisT.aLike * 1.0)),
            Polls.options(title: _thisT.B ?? '', value: (_thisT.bLike * 1.0)),
          ],
          question: Text(
            'Which one would You prefer?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          currentUser: 'you',
          creatorID: 'snapinsight',
          voteData: usersWhoVoted,
          userChoice: usersWhoVoted['you'],
          onVoteBackgroundColor: Colors.blue,
          leadingBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          onVote: (choice) async {
            setState(() {
              BlocProvider.of<PollBloc>(context)
                  .add(PollEvent.replace(widget.index, choice));
              usersWhoVoted['you'] = choice;
            });
            if (choice == 1) {
              setState(() {
                _thisT.aLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'this_that', sr_no: _thisT.sr_no, field: 'aLike');
            }
            if (choice == 2) {
              setState(() {
                _thisT.bLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'this_that', sr_no: _thisT.sr_no, field: 'bLike');
            }
          },
        ),
      ),
      //  Column(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 8.0,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         alignment: Alignment.center,
      //         child: Text(
      //           'Which one would You prefer?',
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () async {
      //         if (!thispressed) {
      //           setState(() {
      //             _index = 1;
      //             ++_thisT.aLike;
      //             thispressed = true;
      //           });
      //           await DatabaseService().likeTransction(collection: 'this_that',sr_no: _thisT.sr_no, field: 'aLike');

      //         }
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Container(
      //           width: double.maxFinite,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20.0),
      //             border: Border.all(
      //                 color: _index == 1 ? Colors.blueAccent : Colors.black12),
      //             color: Colors.grey[200],
      //           ),
      //           child: Center(
      //             child: Padding(
      //               padding: EdgeInsets.all(5.0),
      //               child: Text(
      //                 (_thisT.A ?? '') + " ${_thisT.aLike}",
      //                 style: TextStyle(fontSize: 22.0),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () async {
      //         if (!thispressed) {
      //           setState(() {
      //             _index = 2;
      //             thispressed = true;
      //             ++_thisT.bLike;
      //           });
      //           await DatabaseService().likeTransction(collection: 'this_that',sr_no: _thisT.sr_no, field: 'bLike');

      //         }
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Container(
      //           width: double.maxFinite,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20.0),
      //             border: Border.all(
      //                 color: _index == 2 ? Colors.blueAccent : Colors.black12),
      //             color: Colors.grey[200],
      //           ),
      //           child: Center(
      //             child: Padding(
      //               padding: EdgeInsets.all(5.0),
      //               child: Text(
      //                 (_thisT.B ?? '') + " ${_thisT.bLike}",
      //                 style: TextStyle(fontSize: 22.0),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

/* poll card displayin widget */
class GetListView1 extends StatefulWidget {
  final PollsModel poll;
  final List<dynamic> choice;
  final int index;
  GetListView1({Key key, this.poll, this.choice, this.index});

  @override
  _GetListView1State createState() => _GetListView1State();
}

class _GetListView1State extends State<GetListView1> {
  bool pollPressed = false;
  PollsModel _poll;
  Map usersWhoVoted = {};
  @override
  void initState() {
    setState(() {
      _poll = widget.poll;
      if (widget.choice[widget.index] != 0)
        usersWhoVoted['you'] = widget.choice[widget.index];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Polls(
          children: [
            // This cannot be less than 2, else will throw an exception
            Polls.options(title: _poll.A ?? '', value: (_poll.aLike * 1.0)),
            Polls.options(title: _poll.B ?? '', value: (_poll.bLike * 1.0)),
            Polls.options(title: _poll.C ?? '', value: (_poll.cLike * 1.0)),
            Polls.options(title: _poll.D ?? '', value: (_poll.dLike * 1.0)),
          ],
          question: Text(
            _poll.question ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          currentUser: 'you',
          creatorID: 'snapinsight',
          voteData: usersWhoVoted,
          userChoice: widget.choice[widget.index],
          onVoteBackgroundColor: Colors.blue,
          leadingBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          onVote: (choice) async {
            setState(() {
              BlocProvider.of<PollBloc>(context)
                  .add(PollEvent.replace(widget.index, choice));
              usersWhoVoted['you'] = choice;
            });
            if (choice == 1) {
              setState(() {
                _poll.aLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'polls', sr_no: _poll.sr_no, field: 'aLike');
            }
            if (choice == 2) {
              setState(() {
                _poll.bLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'polls', sr_no: _poll.sr_no, field: 'bLike');
            }
            if (choice == 3) {
              setState(() {
                _poll.cLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'polls', sr_no: _poll.sr_no, field: 'cLike');
            }
            if (choice == 4) {
              setState(() {
                _poll.dLike += 1;
              });
              await DatabaseService().likeTransction(
                  collection: 'polls', sr_no: _poll.sr_no, field: 'dLike');
            }
          },
        ),
      ),
    );
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: 8.0,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: Text(
    //             _poll.question ?? '',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!pollPressed) {
    //             setState(() {
    //               _index = 1;
    //                pollPressed=true;
    //               ++_poll.aLike;
    //             });
    //             await DatabaseService().likeTransction(
    //                 collection: 'polls', sr_no: _poll.sr_no, field: 'aLike');

    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 1 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Center(
    //               child: Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: Text(
    //                   (_poll.A ?? '') + " ${_poll.aLike}",
    //                   style: TextStyle(fontSize: 22.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!pollPressed) {
    //             setState(() {
    //               _index = 2;
    //               pollPressed = true;
    //               ++_poll.bLike;
    //             });
    //             await DatabaseService().likeTransction(
    //                 collection: 'polls', sr_no: _poll.sr_no, field: "bLike");
    //             ;
    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 2 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Center(
    //               child: Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: Text(
    //                   (_poll.B ?? '') + " ${_poll.bLike}",
    //                   style: TextStyle(fontSize: 22.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!pollPressed) {
    //             setState(() {
    //               _index = 3;
    //               pollPressed = true;
    //               ++_poll.cLike;
    //             });
    //             await DatabaseService().likeTransction(
    //                 collection: 'polls', sr_no: _poll.sr_no, field: 'cLike');

    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 3 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Center(
    //               child: Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: Text(
    //                   (_poll.C ?? '') + " ${_poll.cLike}",
    //                   style: TextStyle(fontSize: 22.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           if (!pollPressed) {
    //             setState(() {
    //               _index = 4;
    //               pollPressed = true;
    //               ++_poll.dLike;
    //             });
    //             await DatabaseService().likeTransction(
    //                 collection: 'polls', sr_no: _poll.sr_no, field: 'dLike');

    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Container(
    //             width: double.maxFinite,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               border: Border.all(
    //                   color: _index == 4 ? Colors.blueAccent : Colors.black12),
    //               color: Colors.grey[200],
    //             ),
    //             child: Center(
    //               child: Padding(
    //                 padding: EdgeInsets.all(5.0),
    //                 child: Text(
    //                   (_poll.D ?? '') + " ${_poll.dLike}",
    //                   style: TextStyle(fontSize: 22.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10.0,
    //       ),
    //     ],
    //   ),
    // );
  }
}

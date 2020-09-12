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
  //  Future<int> checkDate() async {
  //   Box _box = await Hive.openBox("date");
  //   String saveDate = await _box.get("date");
  //   DateTime now = DateTime.now();
  //   String date = DateFormat('EEE, M/d/y').format(now);
  //   if (date == saveDate) {
  //     return 0 ; //change to zero for testing purpose
  //   } else {
  //     _box.put("date", date);
  //     return 0;
  //   }
  // }

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
        // if (current.length > previous.length) {
        //   return true;
        // }
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
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/factsModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBloc.dart';
import 'package:moodish_mvp/screens/Food/components/shareDialog.dart';
import 'package:moodish_mvp/screens/Food/events/pollsEvent.dart';

class FoodftTab extends StatefulWidget {
  @override
  _FoodftTabState createState() => _FoodftTabState();
}

class _FoodftTabState extends State<FoodftTab> {
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
      builder: (BuildContext context, f_fact) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: f_fact['fft'].length,
          itemBuilder: (BuildContext context, index) {
            return getListView(
                fact: f_fact['fft'][index],
                like: f_fact['like'][index],
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

class getListView extends StatefulWidget {
  final FactModel fact;
  int index;
  int like;
  getListView({
    this.fact,
    this.index,
    this.like,
  });

  @override
  _getListViewState createState() => _getListViewState();
}

class _getListViewState extends State<getListView> {
  bool _like = false;
  @override
  void initState() {
    if (widget.like == 1)
      setState(() {
        _like = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
                    icon: !_like
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
                        BlocProvider.of<PollBloc>(context)
                            .add(PollEvent.like(widget.index));
                        _like = true;
                      });
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.add_circle_outline,
                  //     size: 25,
                  //   ),
                  //   onPressed: () {},
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.reply,
                      size: 25,
                    ),
                    onPressed: () async {
                      final action = await Dialogs.yesAbortDialog(
                          context, 'My title', 'My Body');
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

class PollTabs extends StatefulWidget {
  @override
  _PollTabsState createState() => _PollTabsState();
}

class _PollTabsState extends State<PollTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          itemBuilder: (context , index){
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Which country pizza was orignated from?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      onPressed: () {  },
                      child: Text('Italy'),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      onPressed: () {  },
                      child: Text('Mexico'),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      onPressed: () {  },
                      child: Text('Germany'),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      onPressed: () {  },
                      child: Text('Canada'),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),
            );
          }),


    );
  }
}

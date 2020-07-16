import 'package:flutter/material.dart';

class PollTabs extends StatefulWidget {
  @override
  _PollTabsState createState() => _PollTabsState();
}

class _PollTabsState extends State<PollTabs> {
  @override
  Widget build(BuildContext context) {
    return getListView();

  }
}

class getListView extends StatelessWidget {
  const getListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Text('Which country pizza was orignated from?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),),
            ),
          ),
          GestureDetector(
            onTap: (){},
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
                    child: Text('Italy',
                      style: TextStyle(
                          fontSize: 22.0
                      ),),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
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
                    child: Text('Mexico',
                      style: TextStyle(
                          fontSize: 22.0
                      ),),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
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
                    child: Text('Germany',
                      style: TextStyle(
                          fontSize: 22.0
                      ),),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
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
                    child: Text('Canada',
                      style: TextStyle(
                          fontSize: 22.0
                      ),),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}

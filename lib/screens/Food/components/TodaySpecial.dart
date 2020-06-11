

import 'package:flutter/material.dart';

class TodaySpecial extends StatefulWidget {
  const TodaySpecial({
    Key key,
    @required this.image,
    @required this.descrip1,
    @required this.descrip2,
  }) : super(key: key);

  final  image;
  final  descrip1;
  final  descrip2;

  @override
  _TodaySpecialState createState() => _TodaySpecialState();
}

class _TodaySpecialState extends State<TodaySpecial> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.2,
      child: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.1, .5],
                colors: [
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.3),
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white,),
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.descrip1, style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(widget.descrip2, style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(height: 15),
                      FlatButton(
                        onPressed: () {},
                        child: IconButton(
                          icon: Icon(Icons.restaurant,color: Colors.white,size: 35,),
                          onPressed: () {},
                        ), 
                        // label: Text(''),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FlatButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.info_outline,color: Colors.white,), 
                            label: Text(
                              'More info',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),
                          FlatButton.icon(
                            onPressed: () => _onButtonPressed(), 
                            icon: Icon(Icons.filter_center_focus,color: Colors.white,), 
                            label: Text(
                              'Filter',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(context: context,builder: (context) {
      return Column(
        children: <Widget>[
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => EntryItem(
                data[index],
              ),
            ),
          ),
        ],
      );
    });
  }
}

// Expansion List
class Entry {
  final title;
  final List<Entry> 
      children;
  Entry(this.title, [this.children = const <Entry>[] ]);
}

final List<Entry> data = <Entry>[
  Entry(
    'Title 1',
    <Entry>[
      Entry(
        'descriptionnbvbdjvj\n bsdhbfh\n jbdvhb\n jdbhb',
      )
    ]
  )
];

// Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if(root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
  
}
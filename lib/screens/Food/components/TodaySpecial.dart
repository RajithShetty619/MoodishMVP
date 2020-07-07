import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/screens/Food/components/shareDialog.dart';
import 'package:moodish_mvp/screens/Food/components/stepSlider.dart';

class TodaySpecial extends StatefulWidget {
  const TodaySpecial({
    Key key,
    @required this.image,
    @required this.descrip1,
    @required this.descrip2,
  }) : super(key: key);

  final image;
  final descrip1;
  final descrip2;

  @override
  _TodaySpecialState createState() => _TodaySpecialState();
}

class _TodaySpecialState extends State<TodaySpecial> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.2,
      child: Stack(
        children: <Widget>[
           CachedNetworkImage(
            imageUrl: widget.image,
            imageBuilder: (context, imageProvider) {
          return Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:  imageProvider,
                  fit: BoxFit.cover,
                )),
            );
            }
          ),
            Container(
            margin: EdgeInsets.only(right: 20), 
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, stops: [
                    .1,
                    .5
                  ], colors: [
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.3),
                  ])),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          final action = await Dialogs.yesAbortDialog(
                              context, 'My title', 'My Body');
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.descrip1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.descrip2,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              // color: Colors.blue[300],
                              child: IconButton(
                                icon: Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              IntroScreen()));
                                },
                              ),
                            ),
                          ),

                          // label: Text(''),
                        ),
                        // SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                )),
                            FlatButton.icon(
                                onPressed: () => _onButtonPressed(),
                                icon: Icon(
                                  Icons.filter_center_focus,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Filter',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
        ],
      )
     /*  child: CachedNetworkImage(
        imageUrl: widget.image,
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:  imageProvider,
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, stops: [
                    .1,
                    .5
                  ], colors: [
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.3),
                  ])),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          final action = await Dialogs.yesAbortDialog(
                              context, 'My title', 'My Body');
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.descrip1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.descrip2,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              // color: Colors.blue[300],
                              child: IconButton(
                                icon: Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              IntroScreen()));
                                },
                              ),
                            ),
                          ),

                          // label: Text(''),
                        ),
                        // SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'More info',
                                  style: TextStyle(color: Colors.white),
                                )),
                            FlatButton.icon(
                                onPressed: () => _onButtonPressed(),
                                icon: Icon(
                                  Icons.filter_center_focus,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Filter',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ), */
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => EntryItem(
                      data[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//items in the second Tite
class ExpItem extends StatelessWidget {
  const ExpItem({
    Key key,
    @required this.image,
  }) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(500),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(500),
                shape: BoxShape.circle,
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.1),
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Text(types, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//items in the second Tite

// Expansion List
class Entry {
  final Widget title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry(Text('Title 1'), <Entry>[
    Entry(
      Text('descriptionWoda\n wodafaq\n wakanda\n wakandashitissdis'),
    ),
  ]),
  Entry(Text('Title 2'), <Entry>[
    Entry(
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          key: PageStorageKey('myScrollable'),
          children: <Widget>[
            ExpItem(image: 'assets/img.jpg'),
            ExpItem(image: 'assets/img.jpg'),
            ExpItem(image: 'assets/img.jpg'),
            ExpItem(image: 'assets/img.jpg'),
            ExpItem(image: 'assets/img.jpg'),
            ExpItem(image: 'assets/img.jpg'),
          ],
        ),
      ),
    )
  ]),
];

// Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: root.title,
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: root.title,
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

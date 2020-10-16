import 'package:flutter/material.dart';

class AddPicture extends StatefulWidget {
  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  int _selected;

  List<String> picCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_back,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0, top: 5),
                            child: Text(
                              'Yauatcha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 8, right: 75, bottom: 5),
                            child: Divider(
                              thickness: 1.2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 14,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '4.5(289)',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.alarm,
                                    size: 11,
                                  ),
                                  Text(
                                    '15-20 mins',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '\u20B9 Free',
                                style: TextStyle(fontSize: 12.5),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
                Text(
                  'The picture is of?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                        });
                        picCategory.clear();
                        picCategory.add('Ambience');
                        print(picCategory);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.orange[700]),
                            color: _selected == 1
                                ? Colors.orange
                                : Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Ambience',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 2;
                        });
                        picCategory.clear();
                        picCategory.add('Food');
                        print(picCategory);
                      },
                      child: Container(
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.orange[700]),
                            color: _selected == 2
                                ? Colors.orange
                                : Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Center(
                              child: Text(
                            'Food',
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 3;
                        });
                        picCategory.clear();
                        picCategory.add('Other');
                        print(picCategory);
                      },
                      child: Container(
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.orange[700]),
                            color: _selected == 3
                                ? Colors.orange
                                : Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Center(
                              child: Text(
                            'Other',
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Picture',
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
                Text(
                  'Please add the picture of square type, i.e. 300x300',
                  style: TextStyle(fontSize: 14.5),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    color: Colors.grey[400],
                    child: Center(
                      child: Text.rich(TextSpan(
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                          children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.add,
                              size: 19,
                              color: Colors.grey[700],
                            )),
                            TextSpan(text: 'Add Picture'),
                          ])),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LikedFood extends StatefulWidget {
  @override
  _LikedFoodState createState() => _LikedFoodState();
}

class _LikedFoodState extends State<LikedFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Liked Food',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5,mainAxisSpacing: 5),
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  );
                }),
          )
        ],
      )),
    );
  }
}

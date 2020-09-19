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
            child: Container(
              height: MediaQuery.of(context).size.height / 1.35,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.2),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){},//Push Pageeeeeeeeee
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Chocolate.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                            top:165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Food_Name',
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width/15,fontWeight: FontWeight.bold,color: Colors.white),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:12.0),
                                  child: Text('Cuisine',//
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width/17,color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left:167,
                            top:10,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.favorite,color: Colors.pink,size: 30,),
                            ),
                          )


                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}

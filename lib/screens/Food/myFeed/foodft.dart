import 'package:flutter/material.dart';

class FoodftTab extends StatefulWidget {
  @override
  _FoodftTabState createState() => _FoodftTabState();
}

class _FoodftTabState extends State<FoodftTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          itemBuilder: (context , index){
            return Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Food For Thought',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300.0,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                            image: AssetImage('assets/Salty.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Omega-3 is the most important food item today.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white
                        ),),
                    ),
                  ),
                  SizedBox(height: 10.0,)
                ],
              )
            );
          }),


    );
  }
}
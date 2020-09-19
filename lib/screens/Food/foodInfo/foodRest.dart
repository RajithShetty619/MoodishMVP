import 'package:flutter/material.dart';
class FoodRest extends StatefulWidget {
  @override
  _FoodRestState createState() => _FoodRestState();
}

class _FoodRestState extends State<FoodRest> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
  ListView.builder(
    physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context , index){
      return         Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/7.5,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Restaurant Name',style: TextStyle(fontSize: MediaQuery.of(context).size.width/15),),
                  Text('Cuisine',style: TextStyle(fontSize: MediaQuery.of(context).size.width/16,color: Colors.grey),),
                ],
              ),
              Spacer(),
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.chevron_right,color: Colors.white,),
            )),

            ],
          ),

        )


//        ListTile(
//          leading: Container(
//            height: MediaQuery.of(context).size.height*10,
//            width: 100,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10),
//              border: Border.all(color: Colors.black)
//            ),
//          ),
//          title: Text('Restaurant Name',style: TextStyle(fontSize: MediaQuery.of(context).size.width/15),),
//          subtitle: Text('Cuisine',style: TextStyle(fontSize: MediaQuery.of(context).size.width/16,color: Colors.grey),),
//          trailing: Container(
//              decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: Colors.black
//              ),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Icon(Icons.chevron_right,color: Colors.white,),
//              )),
//        ),
      );
      }),


      ],
    );
  }
}

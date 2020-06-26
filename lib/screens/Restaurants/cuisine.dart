import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/taste.dart';

class Cuisine extends StatefulWidget {
  @override
  _CuisineState createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
  List<GridTileBuilder> cuisine =[
    GridTileBuilder(image: 'NorthIndian.jpeg',cuisine: 'North Indian'),
    GridTileBuilder(image: 'SouthIndian.jpeg',cuisine: 'South Indian'),
    GridTileBuilder(image: 'Chinese.png',cuisine: 'Chinese'),
    GridTileBuilder(image: 'Dessert.jpg',cuisine: 'Desserts'),
    GridTileBuilder(image: 'FastFood.png',cuisine: 'Fast Food'),
    GridTileBuilder(image: 'Beverage.jpg',cuisine: 'Beverages'),
    GridTileBuilder(image: 'Italian.jpg',cuisine: 'Italian'),
    GridTileBuilder(image: 'Mexican.jpg',cuisine: 'Mexican'),
    GridTileBuilder(image: 'Bakery.jpg',cuisine: 'Bakery'),

  ];
  int i=0;
  List<String> pref=['','','','','','','','',''];//all the user preferences are saved here
  String err = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Cuisine',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        color: Colors.orange
                    ),
                    children: [
                      TextSpan(
                          text: '.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 110,
                              color: Colors.black
                          )
                      )
                    ]
                ),
              ),
              SizedBox(height: 25.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Select Any 3 Cuisine of your type :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 7.0,
                  mainAxisSpacing: 7.0,
                ),
                    scrollDirection: Axis.vertical,
                    itemCount: cuisine.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,index){
                      return GestureDetector(
                        onTap: (){
                          debugPrint('tapped');
                          pref[i]=cuisine[index].cuisine;
                          i++;
                          setState(() {
                            cuisine.removeAt(index);
                          });
//                    for(int a=0;a<9;a++)
//                    {
//                      debugPrint(pref[a]);//print elements in pref
//                    }
                        },
                        child: Container(
                          height: 175.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/${cuisine[index].image}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Text(
                              '${cuisine[index].cuisine}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                      );

                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(err,
                          style: TextStyle(
                              color: Colors.red
                          ),)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: (){
                        if(i+1>3)
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Taste();
                              }));
                        else
                          setState(() {
                            err='Select at least 3!';
                          });
                      },
                      color: Colors.green,
                      child: Text('Next->'),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

class GridTileBuilder{
  String image;
  String cuisine;
  GridTileBuilder({this.cuisine,this.image}) ;

}

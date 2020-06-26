import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
class Taste extends StatefulWidget {
  @override
  _TasteState createState() => _TasteState();
}

class _TasteState extends State<Taste> {
  List<GridTileBuilder> taste =[
    GridTileBuilder(image: 'Chocolate.jpg',taste: 'Sweet'),
    GridTileBuilder(image: 'Sour.jpeg',taste: 'Sour'),
    GridTileBuilder(image: 'Spicy.jpg',taste: 'Hot n Spicy'),
    GridTileBuilder(image: 'Coffee.jpg',taste: 'Aromatic'),
    GridTileBuilder(image: 'Savory.jpg',taste: 'Savory'),
    GridTileBuilder(image: 'Salty.jpg',taste: 'Salty'),
  ];
  int i=0;
  List<String> pref=['','','','','',''];
  String err= '';

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
                    text: 'Know Your',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 75,
                        color: Colors.green
                    ),
                    children: [
                      TextSpan(
                          text: 'Taste.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 75,
                              color: Colors.pinkAccent
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 7.0,
                  mainAxisSpacing: 7.0,
                ),
                    scrollDirection: Axis.vertical,
                    itemCount: taste.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,index){
                      return GestureDetector(
                        onTap: (){
                          debugPrint('tapped');
                          pref[i]=taste[index].taste;
                          i++;
                          setState(() {
                            taste.removeAt(index);
                          });
//                    for(int a=0;a<9;a++)
//                    {
//                      debugPrint(pref[a]);
//                    }
                        },
                        child: Container(
                          height: 125.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/${taste[index].image}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Text(
                              '${taste[index].taste}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                        ),
                      );

                    }
                ),
              ),
              SizedBox(height: 10.0,),
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
                                return MainScreen();
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
  String taste;
  GridTileBuilder({this.taste,this.image}) ;

}

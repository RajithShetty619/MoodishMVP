import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';

class LatestRecipeInfo extends StatefulWidget {
  @override
  _LatestRecipeInfoState createState() => _LatestRecipeInfoState();
}

class _LatestRecipeInfoState extends State<LatestRecipeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15, top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Latest Recipes",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FoodInfoCard(

                    //         )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(
                                  image: AssetImage('assets/Coffee.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aamras',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Indian',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            Container(
                              height: 0.8,
                              width: MediaQuery.of(context).size.width / 2.5,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fastfood,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('273 Calories',
                                    style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.alarm,
                                  size: 12,
                                ),
                                Text('15 mins', style: TextStyle(fontSize: 13))
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 32),
                          child: Container(
                            height: 25,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                                child: Text(
                              'Cook',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

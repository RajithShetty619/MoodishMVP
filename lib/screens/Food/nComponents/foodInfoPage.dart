// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class FoodCard extends StatefulWidget {
//   @override
//   _FoodCardState createState() => _FoodCardState();
// }

// class _FoodCardState extends State<FoodCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height*2.52,
//                 child: Stack(
//                   alignment: Alignment.topLeft,
//                   overflow: Overflow.visible,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 250,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/Coffee.jpg'),
//                               fit: BoxFit.cover)),
//                     ),
//                     Positioned(
//                       top: 185,
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(60))),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(top: 30, left: 35),
//                                 child: Text(
//                                   '5 Seed Moon Cake',
//                                   style: TextStyle(
//                                       fontSize: 28, fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 5, left: 35, right: 40),
//                                 child: Text(
//                                   'Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex  consequat. Dui in reprehenderit in voluptate pariatur. laborum.',
//                                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.only(left: 24, top: 5, right: 8),
//                                     child: Card(
//                                       elevation: 5,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(50)),
//                                       ),
//                                       child: Container(
//                                         height: 110,
//                                         width: 62,
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               height: 50,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.black87,
//                                                   shape: BoxShape.circle),
//                                               child: Center(
//                                                 child: Text(
//                                                   'Indian',
//                                                   style: TextStyle(
//                                                       color: Colors.orange,
//                                                       fontSize: 12),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.all(8),
//                                               child: Text(
//                                                 'Cuisine',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 12),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 5, right: 8),
//                                     child: Card(
//                                       elevation: 5,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(50)),
//                                       ),
//                                       child: Container(
//                                         height: 110,
//                                         width: 62,
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               height: 55,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.black87,
//                                                   shape: BoxShape.circle),
//                                               child: Center(
//                                                 child: Text(
//                                                   'Happy',
//                                                   style: TextStyle(
//                                                       color: Colors.orange,
//                                                       fontSize: 12),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.all(8),
//                                               child: Text(
//                                                 'Mood',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 12),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 5, right: 8),
//                                     child: Card(
//                                       elevation: 5,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(50)),
//                                       ),
//                                       child: Container(
//                                         height: 110,
//                                         width: 62,
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               height: 55,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.black87,
//                                                   shape: BoxShape.circle),
//                                               child: Center(
//                                                 child: Text(
//                                                   '75 mins',
//                                                   style: TextStyle(
//                                                       color: Colors.orange,
//                                                       fontSize: 11),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.all(8),
//                                               child: Text(
//                                                 'Cooking\n  Time',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 12),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(top: 5, left: 10),
//                                         child: Text(
//                                           'Servings',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.grey[600]),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 15, top: 10),
//                                         child: Container(
//                                           height: 50,
//                                           width: 50,
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.black87),
//                                           child: Center(
//                                             child: Text(
//                                               '10',
//                                               style: TextStyle(color: Colors.orange),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(left: 22),
//                                       child: Text(
//                                         'Nutrients',
//                                         style: TextStyle(
//                                             fontSize: 26,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Padding(
//                                       padding: EdgeInsets.only(right: 35),
//                                       child: Icon(
//                                         Icons.add_circle_outline,
//                                         size: 28,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width:  MediaQuery.of(context).size.width,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 35),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(padding: EdgeInsets.only(bottom: 3,top: 15),
//                                           child: Text('Calories',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('Carbohydrates',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('Protien',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('Fats',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 35),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(padding: EdgeInsets.only(bottom: 3,top: 15),
//                                             child: Text('330',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('45g',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('5g',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                           Padding(padding: EdgeInsets.only(bottom: 3),
//                                             child: Text('16g',style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
//                                           ),
//                                         ],
//                                       ),
//                                     )

//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 20,),
//                               Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 22),
//                                         child: Container(
//                                             decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 2.5),borderRadius: BorderRadius.circular(5)),
//                                             child: Icon(Icons.list,size: 30,color: Colors.orange,)),
//                                       ),
//                                       SizedBox(width: 15,),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Ingredients',
//                                             style: TextStyle(
//                                                 fontSize: 26,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                           Text('A checklist before you can start cooking',style: TextStyle(color: Colors.grey[600]),),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 20,left: 22,right: 22,bottom: 15),
//                                     child: Divider(thickness: 1.5,color: Colors.black87,),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 22),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('50g Salted Butter',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87,),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('1 Vanilla Pod',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('Custard',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('150ml Milk',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('Scrapped seeds',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('50g Suet',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
//                                           child: Text('250g Salts',style: TextStyle(fontSize: 18),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 100,bottom: 10),
//                                           child: Divider(thickness: 1.2,color: Colors.black87),
//                                         ),
//                                         SizedBox(height: 15,),
//                                         Align(alignment: Alignment.centerRight,child: Padding(padding: EdgeInsets.only(right: 20),
//                                         child: Text('Read More...',style: TextStyle(fontSize: 18),),
//                                         ),)
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 30,),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 22),
//                                             child: Container(
//                                                 child: Icon(Icons.radio_button_checked,size: 30,
//                                                 color: Colors.orange,)),
//                                           ),
//                                           SizedBox(width: 15,),
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 'Directions',
//                                                 style: TextStyle(
//                                                     fontSize: 24.5,
//                                                     fontWeight: FontWeight.w400),
//                                               ),
//                                               Text('Cook better with step by step guide',style: TextStyle(color: Colors.grey[600]),),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                       Padding(padding: EdgeInsets.only(top: 10,bottom: 10,left: 22,right: 22),
//                                       child: Divider(thickness: 1.2,color: Colors.black87,),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 25),
//                                         child: ListView.builder(
//                                             physics: NeverScrollableScrollPhysics(),
//                                             itemCount: 5,
//                                             shrinkWrap: true,
//                                             itemBuilder: (context , index){
//                                               return Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text('Step ${index+1}',style: TextStyle(fontSize: 22),),
//                                                   SizedBox(height: 5,),
//                                                   Text(
//                                                     'Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex  consequat. Dui in reprehenderit in voluptate pariatur. laborum.',
//                                                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                                                   ),
//                                                   SizedBox(height: 10,)
//                                                 ],
//                                               );
//                                             }
//                                         ),
//                                       ),
//                                       SizedBox(height: 30,),
//                                       Align(alignment: Alignment.centerRight,child: Padding(padding: EdgeInsets.only(right: 25),
//                                         child: Text('Read More...',style: TextStyle(fontSize: 18),),
//                                       ),),
//                                       SizedBox(height: 20,)

//                                     ],
//                                   )

//                                 ],
//                               )

//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

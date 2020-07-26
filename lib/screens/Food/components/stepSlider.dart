import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodrecipe.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';

class IntroScreen extends StatefulWidget {
final FoodListModel foodList;

  const IntroScreen({Key key, this.foodList}) : super(key: key);
  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final _key = GlobalKey();
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title:
            'steps' "${widget.foodList.protein}",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title:
            "Step 2",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title:
            "Step 3",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title:
            "Step 4",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title:
            "Step 5",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title:
            "Step 6",
        maxLineTitle: 2, 
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "bkah bakjsbsjnn jnd kjdb ndsjv kjasv kjv kjv kjv kjf js jasf jasdvbv iugvrybwfc gfv ygf bygf ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.black)),
        // pathImage: "images/photo_museum.png", 
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
  }

  void onDonePress() {
    // Do what you want
     Navigator.pop( 
        context
        ); 
  }

  Widget renderNextBtn() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Icon(
        Icons.navigate_next,
        color: Color(0xffD02090),
        size: 35.0,
      ),
    );
  }

  Widget renderDoneBtn() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Icon(
        Icons.done,
        color: Color(0xffD02090),
      ),
    );
  }

  Widget renderSkipBtn() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Icon(
        Icons.skip_next,
        color: Color(0xffD02090),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Colors.grey[400],
      colorActiveDot: Colors.black,
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
} 

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moodish_mvp/screens/Restaurants/cuisine.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Container(
            decoration: BoxDecoration(),
            child: Image.asset(
              'assets/1.png',
              alignment: Alignment.centerRight,
              fit: BoxFit.contain,
            ),
          ),
          title: "Food For Mood",
          body: "Find food for every mood and a lot more in your feed",
          decoration: PageDecoration(
            imagePadding: EdgeInsets.all(15),
            imageFlex: 2,
          )),
      PageViewModel(
          image: Image.asset(
            'assets/1.2.png',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
          ),
          title: "Food Information",
          body:
              "Nutrional information to step-by-step guided recipes and top restaurants for it",
          decoration: PageDecoration(
            imagePadding: EdgeInsets.all(15),
            imageFlex: 2,
          )),
      PageViewModel(
          image: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset(
              'assets/2.png',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
            ),
          ),
          title: "Restaurants",
          body: "Find restaurants based on your location and other preferences",
          decoration: PageDecoration(
            imageFlex: 2,
          )),
      PageViewModel(
          image: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset(
              'assets/2.1.png',
              width: 300,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
            ),
          ),
          title: "Information About Restaurants",
          body:
              "Find information about the restaurants, from directions to it’s specialities",
          decoration: PageDecoration(
            imageFlex: 2,
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      showNextButton: true,
      next: Text(
        'Next',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      skip: Text(
        'Skip',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      done: Text(
        'Done',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cuisine()));
      },
      pages: getPages(),
    );
  }
}

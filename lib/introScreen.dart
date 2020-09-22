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
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            'assets/1.png',
            width: 150,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitHeight,
          ),
        ),
        title: "Food For Mood",
        body: "Find food for every mood and a lot more in your feed",
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Image.asset(
            'assets/1.2.png',
            width: 300.0,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
        ),
        title: "Food Information",
        body:
            "Nutrional information to step-by-step guided recipes and top restaurants for it",
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Image.asset(
            'assets/2.png',
            width: 300,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitHeight,
          ),
        ),
        title: "Restaurants",
        body: "Find restaurants based on your location and other preferences",
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Image.asset(
            'assets/2.1.png',
            width: 300,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitHeight,
          ),
        ),
        title: "Information About Restaurants",
        body:
            "Find information about the restaurants, from directions to it’s specialities",
      ),
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

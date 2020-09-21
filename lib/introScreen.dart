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
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/1.png',
          ),
        ),
        title: "Food For Mood",
        body: "Find food for every mood and a lot more in your feed",
      ),
      PageViewModel(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/1_1.png',
          ),
        ),
        title: "Food Information",
        body:
            "Nutrional information to step-by-step guided recipes and top restaurants for it",
      ),
      PageViewModel(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/2.png',
          ),
        ),
        title: "Restaurants",
        body: "Find restaurants based on your location and other preferences",
      ),
      PageViewModel(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/2_1.png',
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cuisine()));
      },
      pages: getPages(),
    );
  }
}

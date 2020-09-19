import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
            'assets/Coffee.jpg',
            height: 130,
          ),
        ),
        title: "welcome to the intro screen",
        body:
            "ncjjdnnvjkdcnndkckdnnkdn  knvndfvnjav jndvbsfvnvv kajdvjafvkjav kajjanvjakv",
        footer: Text("@meliodas"),
      ),
      PageViewModel(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/Coffee.jpg',
            height: 130,
          ),
        ),
        title: "welcome to the intro screen",
        body:
            "ncjjdnnvjkdcnndkckdnnkdn  knvndfvnjav jndvbsfvnvv kajdvjafvkjav kajjanvjakv",
        footer: Text("@meliodas"),
      ),
      PageViewModel(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/Coffee.jpg',
            height: 130,
          ),
        ),
        title: "welcome to the intro screen",
        body:
            "ncjjdnnvjkdcnndkckdnnkdn  knvndfvnjav jndvbsfvnvv kajdvjafvkjav kajjanvjakv",
        footer: Text("@meliodas"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      showNextButton: true,
      next: Text('Next',style: TextStyle(
        color: Colors.deepOrange,
      ),),
      skip: Text('Skip',style: TextStyle(
        color: Colors.deepOrange,
      ),),
      done: Text(
        'Done',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      onDone: () {},
      pages: getPages(),
    );
  }
}

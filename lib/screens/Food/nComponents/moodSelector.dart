import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class InheritMenu extends InheritedWidget {
//   InheritMenu({Key key, this.child, this.mood}) : super(key: key, child: child);

//   final Widget child;
//   final String mood;

//   static InheritMenu of(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<InheritMenu>();

//   @override
//   bool updateShouldNotify(InheritMenu oldWidget) => mood != oldWidget.mood;
// }

// class MoodMenu extends StatefulWidget {
//   @override
//   _MoodMenuState createState() => _MoodMenuState();
// }

// class _MoodMenuState extends State<MoodMenu> {
//   String mood = "";
//   @override
//   Widget build(BuildContext context) {
//     return InheritMenu(
//       child: MenuSelector(),
//       mood: mood,
//     );
//   }
// }

class MenuSelector extends StatefulWidget {
  @override
  _MenuSelectorState createState() => _MenuSelectorState();
}

class _MenuSelectorState extends State<MenuSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      heroTag: null,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Mood Selector',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              child: RadialMenu(),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Text(
            //     'Selected Mood : ',
            //     style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(
      controller: controller,
    );
  }
}

class RadialAnimation extends StatefulWidget {
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.6,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 120.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 18.84,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  @override
  _RadialAnimationState createState() => _RadialAnimationState();
}

class _RadialAnimationState extends State<RadialAnimation> {
  build(context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: (widget.rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildButton(18,
                  color: Colors.purple, text: 'Happy', context: context),
              _buildButton(90,
                  color: Colors.indigo, text: 'Stressed', context: context),
              _buildButton(162,
                  color: Colors.green, text: 'Sad', context: context),
              _buildButton(234,
                  color: Colors.yellow, text: 'Sluggish', context: context),
              _buildButton(306,
                  color: Colors.orange, text: 'Angry', context: context),
              Transform.scale(
                scale: widget.scale.value - 1.6,
                child: FloatingActionButton(
                    heroTag: null,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(FontAwesomeIcons.timesCircle),
                    ),
                    onPressed: _close,
                    backgroundColor: Colors.red),
              ),
              Transform.scale(
                scale: widget.scale.value,
                child: FloatingActionButton(
                    heroTag: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/MoodishLogo.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    onPressed: _open,
                    backgroundColor: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildButton(double angle, {Color color, String text, BuildContext context}) {
    // String mood = InheritMenu.of(context).mood;
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate((widget.translation.value) * cos(rad),
            (widget.translation.value) * sin(rad)),
      child: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          heroTag: null,
          child: Text(text),
          backgroundColor: color,
          onPressed: () {
            // setState(() {
            //   mood = text;
            // });
            Navigator.pop(context, text);

            _close();
          },
        ),
      ),
    );
  }

  _open() {
    widget.controller.forward();
  }

  _close() {
    widget.controller.reverse();
  }
}

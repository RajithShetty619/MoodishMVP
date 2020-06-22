import 'package:flutter/material.dart';
class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Gallery'),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: _buildGridTiles(29),//Where is this function ?
      ),
    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles) {
  List<Container> containers = new List<Container>.generate(numberOfTiles,
  (int index) {
    //index = 0, 1, 2,...
    final imageName = index < 4 ?
              'img/${index + 1}.png' : 'img/${index + 1}.png';
    return new Container(
      child: new Image.asset(
        imageName,
        fit: BoxFit.fill
      ),
    );
  });
  return containers;
}


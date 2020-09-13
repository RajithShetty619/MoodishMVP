import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
class Gallery extends StatefulWidget {
  final RestListModel restaurant;
  Gallery({Key key, this.restaurant}) : super(key: key);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 120,
          width: 150,
          child: CachedNetworkImage(
            imageUrl: widget.restaurant.photo_url,
            imageBuilder: (context, imageprovider) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageprovider

                        /*  AssetImage('assets/${widget.imgName}') */,
                        fit: BoxFit.cover)),
              );
            },
          ),

        ),
      ),
    );
  }
}

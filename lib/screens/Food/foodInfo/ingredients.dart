import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';

enum DialogAction { yes, abort }

class IngredientDialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    final title,
    final FoodListModel foodList,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: ListView.builder(
            itemCount: foodList.ingredients.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
            return Container(
                              margin: EdgeInsets.all(5.0),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.black, width: 2),
                              //   borderRadius: BorderRadius.circular(15),
                              //   // color: Colors.blue[200],
                              // ),
                              child: Text(
                               "- ${foodList.ingredients [index]}",
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                     fontWeight: FontWeight.bold),
                              ),
                            );

           },
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text('No'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
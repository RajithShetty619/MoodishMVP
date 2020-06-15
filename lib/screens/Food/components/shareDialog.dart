import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    final title,
    final body,
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
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[ 
              IconButton(
                  icon: Icon(
                    Icons.share,
                    size: 50,
                  ),
                  onPressed: () {}),
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(
                    Icons.camera,
                    size: 50,
                  ),
                  onPressed: () {}),
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(
                    Icons.camera,
                    size: 50,
                  ),
                  onPressed: () {}), 
              SizedBox(width: 10),
            ],
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

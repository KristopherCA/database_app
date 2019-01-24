import 'package:flutter/material.dart';

showAlertMessage(BuildContext context, String message) {
  var alert = AlertDialog(
    title: Text('\n\n' + 'Status'),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

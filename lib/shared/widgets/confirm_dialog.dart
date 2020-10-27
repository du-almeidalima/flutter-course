import 'package:flutter/material.dart';

class ConfirmDialog {
  static show(
      {BuildContext context,
      String message,
      Widget content,
      Function confirm}) {

    final Widget cancelButton = RaisedButton(
      child: Text("Cancelar"),
      color: Colors.red,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    final Widget confirmButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        confirm();
        Navigator.of(context).pop();
      },
    );

    final Widget dialog = AlertDialog(
      title: Text(message, textAlign: TextAlign.center,),
      content: content,
      actions: [cancelButton, confirmButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return dialog;
      },
    );
  }
}

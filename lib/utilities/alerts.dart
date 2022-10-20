import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void popupError(
    BuildContext context, String e, Function? onPressed, dynamic arg) {
  print('Alerts: error popup initiated');
  Alert(
    style: AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      backgroundColor: Colors.white,
    ),
    context: context,
    type: AlertType.error,
    title: "ERROR: ",
    desc: "$e",
    buttons: [
      DialogButton(
        color: Colors.red,
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          try {
            onPressed == null ? print('Assign function') : onPressed();
          } catch (e) {
            onPressed == null ? print('Assign function') : onPressed(arg);
          }
        },
        width: 120,
      )
    ],
  ).show();
}

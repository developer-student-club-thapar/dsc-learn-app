// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 📦 Package imports:

/// shows success message toast
showSuccessMessage(BuildContext context, String message) => _showToast(
      message,
      Colors.black,
      Colors.white,
    );

/// shows error message toast
showErrorMessage(BuildContext context, String message) => _showToast(
      message,
      Colors.white,
      Colors.red,
      toastLength: message.length > 80 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );

_showToast(
  String message,
  Color textColor,
  Color backgroundColor, {
  Toast? toastLength,
}) {
  // remove current toast, if any
  Fluttertoast.cancel();
  // show the snack bar
  Fluttertoast.showToast(
    msg: message,
    textColor: textColor,
    backgroundColor: backgroundColor,
    toastLength: toastLength,
  );
}

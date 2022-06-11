import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class DialogUtils {

  //This static function is used to display a snackBar anywhere from App.
  static showSnack(String text){
    showSimpleNotification(
      Text(
        text
      ),
      background: Colors.black87,
    );
  }
}
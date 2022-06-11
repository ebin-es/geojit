import 'package:flutter/material.dart';

//Theme data is added here, so that changes can be applied globally.

ThemeData mainTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
  ),
);

OutlineInputBorder borderStyle = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(
    width: 2,
    color: Colors.green,
  ),
  gapPadding: 2,
);
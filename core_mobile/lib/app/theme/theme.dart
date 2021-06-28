import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.red,
  accentColor: Colors.amber,
  fontFamily: 'Lato',
  // canvasColor: Color.fromRGBO(255, 254, 229, 1),
  textTheme: ThemeData.light().textTheme.copyWith(
        headline6: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
);

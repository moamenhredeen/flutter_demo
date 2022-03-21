
import 'dart:collection';

import 'package:flutter/material.dart';

enum Themes{
  Dark,
  Light
}



ThemeData get greenTheme => ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF007f5d),
);


ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple
);
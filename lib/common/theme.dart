// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
var mainColor = 0xff275c3b;
var secondaryColor = 0xff4fa0c5;

Map<int, Color> color = {
  50: Color(secondaryColor).withOpacity(0.1),
  100: Color(secondaryColor).withOpacity(0.2),
  200: Color(secondaryColor).withOpacity(0.3),
  300: Color(secondaryColor).withOpacity(0.4),
  400: Color(secondaryColor).withOpacity(0.5),
  500: Color(secondaryColor).withOpacity(0.6),
  600: Color(secondaryColor).withOpacity(0.7),
  700: Color(secondaryColor).withOpacity(0.8),
  800: Color(secondaryColor).withOpacity(0.9),
  900: Color(secondaryColor).withOpacity(1.0),
};

final appTheme = ThemeData(
  primarySwatch: MaterialColor(secondaryColor, color),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(secondaryColor), // Background color (orange in my case).
    textTheme: ButtonTextTheme.primary,    
  ),
);
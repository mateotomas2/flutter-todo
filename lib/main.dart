// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertodo/screens/ConfigMenu.dart';
import 'package:fluttertodo/screens/TodoAdd.dart';
import 'package:fluttertodo/screens/TodoList.dart';

import 'package:provider/provider.dart';
import 'package:fluttertodo/common/theme.dart';

import 'models/config/ConfigModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => ConfigModel()),       
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
            const Locale('en', 'US'),
            const Locale('es', 'ES'),
            const Locale('ru', 'RU'),
        ],
        routes: {
          TodoList.routeName: (context) => TodoList(title: 'Todo list'),
          TodoAdd.routeName: (context) => TodoAdd(title: 'Add Todo'),
          ConfigMenu.routeName: (context) => ConfigMenu(title: 'Configure'),
        },
      ),
    );
  }
}
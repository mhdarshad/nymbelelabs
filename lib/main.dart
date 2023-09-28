import 'dart:convert';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nymbelelabs/rought_genrator.dart';

void main() {
  runApp(EasyDynamicThemeWidget(
    child: const MyApp(),
  ), );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme:ThemeData(brightness: Brightness.light,backgroundColor: Colors.white60,),
      darkTheme: ThemeData(brightness: Brightness.dark,backgroundColor: Colors.black45),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      routerConfig: router,
    );
  }
}
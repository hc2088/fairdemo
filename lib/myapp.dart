import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

import 'listpage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(data: {'title': 'Flutter Demo Home Page'}));
      routes: {
        '/': (BuildContext context) => ListPage(),
        "/lib_simplepage": (_) => scafold(
            FairWidget(
                name: '58 Fair',
                path: 'assets/bundle/lib_simplepage.fair.json',
                data: {
                  'fairProps': jsonEncode({'title': '58 Fair'})
                }),
            'lib_homepage'),
        '/lib_countpage': (_) => FairWidget(
                name: '58 Fair',
                path: 'assets/bundle/lib_countpage.fair.json',
                data: {
                  'fairProps': jsonEncode({'title': '58 Fair'})
                }),
        "/lib_IfEqualBoolPage": (_) => FairWidget(
                name: '58 Fair',
                path: 'assets/bundle/lib_IfEqualBoolPage.fair.json',
                data: {
                  'fairProps': jsonEncode({'count': 1, 'pageName': '58 Fair'})
                }),
      },
    );
  }
}

scafold(Widget child, String title) {
  return Scaffold(
    body: child,
    appBar: AppBar(
      title: Text(title),
    ),
  );
}

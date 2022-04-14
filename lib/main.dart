import 'package:fair/fair.dart';

import 'package:flutter/material.dart';

import 'myappfair.dart';

void main() {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    _getApp(),
    plugins: {},
  );
}

dynamic _getApp() => FairApp(
      modules: {},
      delegate: {},
      child: MyAppFair(),
    );

import 'package:flutter/material.dart';
import 'package:the_basics/views/layout_template/layout_template.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: LayoutTemplate(),
    );
  }
}
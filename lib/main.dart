import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/stars_experiment.dart';
import 'package:flutter_animated_stars/storybook.dart';

void main() {
  // runApp(MyApp());
  runApp(Storybook());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StarsExperiment(),
      appBar: AppBar(title: Text(title)),
    );
  }
}

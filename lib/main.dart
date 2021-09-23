import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white),
            headline2: TextStyle(fontSize: 24.0),
            headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white)),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


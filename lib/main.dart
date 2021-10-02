import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';
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
            headline2: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),
            headline3: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.grey),
            headline4: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),
            headline5: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.black),
            headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white)),
        primarySwatch: Colors.indigo,
      ),
      //home: LoginPage(),
      routes: {
        LoginPage.routeName : (context) => const LoginPage(),
        HomePage.routeName : (context) => const HomePage(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}



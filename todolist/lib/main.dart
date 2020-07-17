import 'package:flutter/material.dart';
import 'package:todolist/pages/onboadring_page.dart';
import 'package:todolist/pages/todopage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.red,
      ),
      home:OnboardingPage(),
    );
  }
}


import 'package:budupdated/homePage.dart';
import 'package:budupdated/views/sign_up_forum.dart';
import 'package:budupdated/views/signin.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BUD',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MainApp(),
        '/signup': (BuildContext context) => new SignupForum(),
      },
      //home: new MyHomePage(),
      home: new Signin(),
    );
  }
}

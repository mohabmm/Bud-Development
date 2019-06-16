import 'package:budupdated/splash_state.dart';
import 'package:budupdated/views/introscreen.dart';
import 'package:budupdated/views/sign_up_form.dart';
import 'package:budupdated/views/signin.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatefulWidget {
  @override
  StateClass createState() => StateClass();
}

class StateClass extends State<MainApp> {
  bool intro = false;
  final color = const Color(0xFF13DDD2);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUD',
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
        accentColor: Colors.lightBlue[800],
      ),
      routes: <String, WidgetBuilder>{
        "MySplashScreen": (_) => MySplashScreen(),
        "Signin": (_) => Signin(),
        '/landingpage': (BuildContext context) => new MainApp(),
        '/signup': (BuildContext context) => new SignupForm(),
      }, 
      home: new SplashState(),
    );
  }
}

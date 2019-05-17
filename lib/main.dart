import 'package:budupdated/splash_state.dart';
import 'package:budupdated/views/introscreen.dart';
import 'package:budupdated/views/sign_up_form.dart';
import 'package:budupdated/views/signin.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatefulWidget{
  @override
  StateClass createState() => StateClass();

}
class StateClass extends State<MainApp> {

  bool intro=false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BUD',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "MySplashScreen":(_)=>MySplashScreen(),
        "Signin":(_)=>Signin(),
        '/landingpage': (BuildContext context) => new MainApp(),
        '/signup': (BuildContext context) => new SignupForm(),
      },
      home: new SplashState(),
    );
  }
}


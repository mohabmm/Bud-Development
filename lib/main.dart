import 'package:budupdated/views/SignUpForum.dart';
import 'package:budupdated/views/signinforum.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  String title = 'BUD';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BUD',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Signin(),
    );
  }
}

class Signin extends StatelessWidget {
  static final route = "/Signin-page";

  void signup(BuildContext context) {
    {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/SignupForum', (Route<dynamic> route) => true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupColor = const Color(0xFF3d3d3d);
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/login-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Padding(
          padding: const EdgeInsets.all(20.00),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 60.0),
                child: new Text(
                  "It's dangerouse to go alone,grap a bud ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.lightBlueAccent,
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninForum(),
                      ),
                    ),
                child: new Text(
                  "Log in ",
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.00),
              ),
              new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupForum(),
                      ),
                    ),
                //SignupForum(),
                color: signupColor,
                child: new Text(
                  "Sign up ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.00),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

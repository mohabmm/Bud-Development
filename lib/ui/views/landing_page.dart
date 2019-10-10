import 'package:budupdated/core/viewmodels/authntication_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_widget.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onSignedIn;
  const LandingPage({Key key, this.onSignedIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthServiceModel>(
      model: AuthServiceModel(),
      builder: (
        context,
        model,
        child,
      ) =>
          Scaffold(
        body: _getListUi(context, model),
      ),
    );
  }
}

Widget _getListUi(BuildContext context, AuthServiceModel model) {
  final signUpColor = const Color(0xFF3d3d3d);
  var user = Provider.of<FirebaseUser>(context);
  return Container(
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
              "It's dangerous to go alone,grab a bud ",
              key: Key("signintext"),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
          new RaisedButton(
            key: Key("sparta"),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.lightBlueAccent,
            child: new Text(
              "Log in with email and password",
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'signinformem');
            },
          ),

          new Padding(
            padding: const EdgeInsets.all(10.00),
          ),
          new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: new Text(
              "Sign up with email and password ",
              style: TextStyle(color: signUpColor),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'signupform');
            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.00),
          ),
        ],
      ),
    ),
  );
}

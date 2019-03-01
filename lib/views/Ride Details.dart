//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RideDetails extends StatefulWidget {
//  FirebaseUser user;
//  RideDetails({this.user});

  RideDetails();

  @override
  _State createState() => new _State();
}

class _State extends State<RideDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
//          children: <Widget>[new Text(widget.user.displayName)],
          children: <Widget>[new Text("dd")],
        ),
      ),
    );
  }
}

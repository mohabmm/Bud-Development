import 'dart:async';

import 'package:budupdated/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninForum extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SigninForum> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  String mail;
  String password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        title: new Text('Sign In Forum'),
      ),
      body: new Container(
        padding: new EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    mail = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    mail = value;
                  });
                },
                controller: myController1,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  controller: myController2,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              new RaisedButton(onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(email: mail, password: password)
                    .then((user) {
                  if (user.isEmailVerified) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                              user: user,
                            )));
                  } else {
                    _scaffoldstate.currentState.showSnackBar(new SnackBar(
                        content: new Text(
                            "please verify your msa email in order to get access ")));
                  }
                }).catchError((e) => _scaffoldstate.currentState.showSnackBar(
                        new SnackBar(
                            content: new Text(e.toString()),
                            duration: const Duration(minutes: 1))));
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitUsermail(String value) {
    setState(() {
      mail = value;
      print("the user Name " + mail);
    });
  }

//  void _onSubmitPassword(String value) {
//    setState(() {
//      password = value;
//      print("the current  password the user wrote is " + password);
//    });
//  }
//
//  Future<FirebaseUser> _signin() async {
//    FirebaseAuth.instance
//        .signInWithEmailAndPassword(email: mail, password: password);
//  }
}

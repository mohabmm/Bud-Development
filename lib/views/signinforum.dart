import 'dart:async';

import 'package:budupdated/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninForum extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SigninForum> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  String mail;
  String password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                onSubmitted: _onSubmitUsermail,
                onChanged: _onSubmitUsermail,
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
                  onSubmitted: _onSubmitPassword,
                  onChanged: _onSubmitPassword,
                  controller: myController2,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              new RaisedButton(onPressed: () {
                _signin().then((FirebaseUser user) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => HomePage(
                                user: user,
                              )))
                      .catchError((e) => print(e));
                });
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

  void _onSubmitPassword(String value) {
    setState(() {
      password = value;
      print("the current  password the user wrote is " + password);
    });
  }

  Future<FirebaseUser> _signin() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: password);
  }
}

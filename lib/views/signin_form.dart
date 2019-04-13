import 'dart:async';
import 'dart:io';

import 'package:budupdated/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninForm extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SigninForm> {
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
        title: new Text('Sign In Form'),
      ),
      body: Center(
        child: new Container(
          padding: new EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      if (value == null) {
                        _scaffoldstate.currentState.showSnackBar(new SnackBar(
                            content: new Text(
                                "Please write your MSA email in order to login to the app")));
                      } else
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
                        if (value == null) {
                          _scaffoldstate.currentState.showSnackBar(new SnackBar(
                              content: new Text(
                                  "Please write your password in order to login to the app")));
                        } else
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
                new RaisedButton(
                    child: new Text("Log in "),
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: mail ?? "", password: password ?? "")
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
                      }).catchError((e) {
                        String error;
                        if (Platform.isAndroid) {
                          switch (e.message) {
                            case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                              error =
                                  "UserNotFound please go and register with your MSA email";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;
                            case 'The password is invalid or the user does not have a password.':
                              error = "PasswordNotValid";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;
                            case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                              error = "NetworkError";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;

                            case ' com.google.firebase.auth.api.internal.zzal@be07b08 is badly formatted':
                              error = "NetworkError";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;

                            case 'Given String is empty or null':
                              error =
                                  "Please write validated email or password dont leave it empty";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;

                            case 'The email address is badly formatted':
                              error = "Please write validated MSA email";
                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(content: new Text(error)));
                              break;

                            // ...
                            default:
                              print('Case ${e.message} is not jet implemented');

                              _scaffoldstate.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text(e.message.toString())));
                          }
                        }
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

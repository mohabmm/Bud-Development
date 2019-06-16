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
  final pass= TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
  String mail;
  String password;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  void _popForgetPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Reset Password",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: new SingleChildScrollView(child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      hintText:" Enter your email",
                     ),
                  style: new TextStyle(
                    fontSize: 15,
                    color: const Color(0xFF000000),
                  )),
              new RaisedButton( child: new Text("Reset"), shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)), color: Colors.lightBlueAccent,onPressed:()async{
                await FirebaseAuth.instance.sendPasswordResetEmail(email: pass.text);
              })
            ],
          ),),

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: new Text('Sign In'),
      ),
      body: Form(
        key: _formKeys,
        autovalidate: _autoValidate,
        child: Center(
          child: new Container(
            padding: new EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    onFieldSubmitted: (value) {
                      setState(() {
                        mail = value;
                      });
                    },
                    onSaved: (value) {
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
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      controller: myController2,
                      validator: _validatePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                  new RaisedButton(
                      child: new Text("Log in "),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        final form = _formKeys.currentState;

                        if (form.validate()) {
                          form.save();
                          setState(() {
                            _autoValidate = true;
                            print("error");
                            if ((mail != null && mail.isNotEmpty) &&
                                (password != null && password.isNotEmpty)) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: mail ?? "",
                                      password: password ?? "")
                                  .then((user) {
                                if (user.isEmailVerified) {
                                  setState(() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => HomePage(
                                                  user: user,
                                                )));
                                  });
                                } else {
                                  _scaffoldstate.currentState.showSnackBar(
                                      new SnackBar(
                                          content: new Text(
                                              "We send verfication email to your MSA email please go and verify it ")));
                                }
                              }).catchError((e) {
                                String error;
                                if (Platform.isAndroid) {
                                  switch (e.message) {
                                    case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                      error =
                                          "UserNotFound please go and register with your MSA email";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;
                                    case 'The password is invalid or the user does not have a password.':
                                      error = "PasswordNotValid";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;
                                    case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                      error = "NetworkError";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;

                                    case ' com.google.firebase.auth.api.internal.zzal@be07b08 is badly formatted':
                                      error = "NetworkError";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;

                                    case 'Given String is empty or null':
                                      error =
                                          "Please write validated email or password dont leave it empty";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;

                                    case 'The email address is badly formatted':
                                      error =
                                          "Please write validated MSA email";
                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(error)));
                                      break;

                                    // ...
                                    default:
                                      print(
                                          'Case ${e.message} is not jet implemented');

                                      _scaffoldstate.currentState.showSnackBar(
                                          new SnackBar(
                                              content: new Text(
                                                  e.message.toString())));
                                  }
                                }
                              });
                            }
                          });
                        } else {
                          // lo feeh 8lta
                          print("error");
                        }
                      }),
              new RaisedButton( child: new Text("Forgot password?"), shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)), color: Colors.lightBlueAccent,onPressed: _popForgetPassword)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

  String _validatePassword(String value) {
    if (value.length > 5) {
      return null;
    }

    return 'Password must be up to 6 characters';
  }

}

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EmailFieldValidator {
  static String validate(String value) {
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
}

class PasswordFieldValidatr {
  static String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password must be up to 6 characters";
    }
    if (value.length > 5) {
      return null;
    }
    if (value.length < 6) {
      return "Password must be up to 6 characters";
    }
  }
}

class SignupForm extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SignupForm> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstname;
  String lastName;
  String email;
  String userName;
  String password;

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: new Text('Sign Up'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
//          ask for it
          autovalidate: _autoValidate,
          child: new ListView(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onFieldSubmitted: _onSubmitFirstName,
                onSaved: _onSubmitFirstName,
                validator: _validatefirstname,
                controller: myController1,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  onFieldSubmitted: _onSubmitLastName,
                  validator: _validatelastname,
                  onSaved: _onSubmitLastName,
                  controller: myController2,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  validator: _validateusername,
                  onFieldSubmitted: _onSubmitUserName,
                  onSaved: _onSubmitUserName,
                  controller: myController6,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              new FlatButton(
                  onPressed: () {
                    _pickSaveImage();
                  },
                  child: new Text(
                    "Click to upload MSA ID front image ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: TextFormField(
                  validator: EmailFieldValidator.validate,
                  onSaved: (value) {
                    if (value.endsWith("msa.edu.eg") ||
                            value.endsWith("MSA.EDU.EG")
                        //Todo: enter doctors email
                        ) {
                      setState(() {
                        email = value.toLowerCase();
                      });
                    } else {
                      _scaffoldstate.currentState.showSnackBar(new SnackBar(
                          content: new Text("please enter  your MSA email")));
                      print("please enter valid MSA mail");
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (value.endsWith("msa.edu.eg") ||
                        value.endsWith("MSA.EDU.EG")) {
                      setState(() {
                        email = value.toLowerCase();
                      });
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: myController4,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
                validator: PasswordFieldValidatr.validatePassword,
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonTheme(
                minWidth: 4.0,
                child: new RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.lightBlueAccent,
                  onPressed: () => Signup(),
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitFirstName(String value) {
    setState(() {
      firstname = value;
      print("the first name the user wrote is " + firstname);
    });
  }

  void _onSubmitLastName(String value) {
    setState(() {
      lastName = value;
      print("the last name the user wrote is " + lastName);
    });
  }

  File imageFiles;

  Future<String> _pickSaveImage() async {
    imageFiles = await ImagePicker.pickImage(source: ImageSource.camera);
    final String fileName = "${Random().nextInt(1000000)}.jpg" + "signupData";
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = ref.putFile(imageFiles);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  void _onSubmitUserName(String value) {
    setState(() {
      userName = value;
      print("the user Name " + value);
    });
  }

  Signup() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      print("yes");

      if (firstname != null &&
          lastName != null &&

          //  imageFiles != null &&
          email != null &&
          userName != null) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((signedInUser) {
          signedInUser.sendEmailVerification();

          var userUpdateInfo = new UserUpdateInfo();
          userUpdateInfo.displayName = userName;
          userUpdateInfo.photoUrl =
              'https://sanitationsolutions.net/wp-content/uploads/2015/05/empty-image.png';
          signedInUser.updateProfile(userUpdateInfo).then((user) {
            FirebaseAuth.instance.currentUser().then((user) {
              Firestore.instance
                  .collection('users')
                  .document(email.toLowerCase())
                  .setData({
                'email': signedInUser.email.toLowerCase(),
                'uid': signedInUser.uid,
                "First Name ": firstname,
                "Last Name": lastName,
                "Number Of Rides As Driver": 0,
                "passengerrate": "0",
                "driverrate": "0",
                "CO2driver": "0",
                "CO2passenger": "0",
                "Number Of Rides As guest": 0,
                "distance covered as passenger": 0,
                "distance covered as driver": 0,
                "photo_url":
                    "https://sanitationsolutions.net/wp-content/uploads/2015/05/empty-image.png",
                "Driver authnticated": false,
              });

              Firestore.instance
                  .collection('Achievements')
                  .document(email)
                  .setData({
                'email': signedInUser.email,
                'first ride as guest': false,
                'third ride as guest': false,
                "fifth ride as guest": false,
                "10 ride as guest": false,
                "20 ride as guest": false,
                "30 ride as guest": false,
                "40 ride as guest": false,
                "50 ride as guest": false,
                "60 ride as guest": false,
                "70 ride as guest": false,
                "80 ride as guest": false,
                "90 ride as guest": false,
                "100 ride as guest": false,
                'first ride as driver': false,
                'third ride as driver': false,
                "fifth ride as driver": false,
                "10 ride as driver": false,
                "20 ride as driver": false,
                "30 ride as driver": false,
                "40 ride as driver": false,
                "50 ride as driver": false,
                "60 ride as driver": false,
                "70 ride as driver": false,
                "80 ride as driver": false,
                "90 ride as driver": false,
                "100 ride as driver": false,
              });
            }).catchError((e) {
              _scaffoldstate.currentState
                  .showSnackBar(new SnackBar(content: new Text(e.toString())));

              print("the error is " + e);
            });
          }).catchError((e) {
            _scaffoldstate.currentState
                .showSnackBar(new SnackBar(content: new Text(e.toString())));

            print("the second error is " + e);
          });
        }).catchError((e) {
//          _scaffoldstate.currentState
//              .showSnackBar(new SnackBar(content: new Text(e.toString())));

          String error;
          if (Platform.isAndroid) {
            switch (e.message) {
              case 'PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)':
                error = "The Email is already in use.Please register with";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;
              case 'The password is invalid or the user does not have a password.':
                error = "Password is not valid";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;
              case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                error = "NetworkError";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;

              case ' com.google.firebase.auth.api.internal.zzal@be07b08 is badly formatted':
                error = "NetworkError";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;

              case 'Given String is empty or null':
                error =
                    "Please write validated email or password dont leave it empty";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;

              case 'The email address is badly formatted':
                error = "Please write validated MSA email";
                _scaffoldstate.currentState
                    .showSnackBar(new SnackBar(content: new Text(error)));
                break;

              // ...
              default:
                print('Case ${e.message} is not jet implemented');

                _scaffoldstate.currentState.showSnackBar(
                    new SnackBar(content: new Text(e.message.toString())));
            }
          }
          print("the third error is" + e);
        });

//        _scaffoldstate.currentState.showSnackBar(new SnackBar(
//            content: new Text("Congutrlation account with email" +
//                " " +
//                email +
//                " " +
//                "is succefully created")));

        await new Future.delayed(const Duration(seconds: 12));

//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => SigninForm(),
//          ),
//        );
      }
    } else {
      print("no");
      setState(() => _autoValidate = true);
    }
  }

  String _validateusername(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter valid user name";
    }
  }

  String _validatelastname(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter valid last name ";
    }
  }

  String _validatefirstname(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter valid first name";
    }
  }
}

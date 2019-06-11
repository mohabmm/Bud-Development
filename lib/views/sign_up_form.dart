import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:budupdated/views/signin_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                  validator: _validateEmail,
                  onSaved: (value) {
                    if (value.endsWith("msa.edu.eg") ||
                        value.endsWith("MSA.EDU.EG")) {
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
                validator: _validatePassword,
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

  Signup() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
    } else {
      setState(() => _autoValidate = true);
    }

//    if (firstname == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(
//            new SnackBar(content: new Text("please enter your firstname")));
//      });
//    }
//    if (lastName == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(
//            new SnackBar(content: new Text("please enter your lastname")));
//      });
//    }
//    if (password == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(
//            new SnackBar(content: new Text("please enter your password")));
//      });
//    }

//    if (email == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(
//            new SnackBar(content: new Text("please enter valid MSA email")));
//      });
//    }
//
//    if (userName == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(
//            new SnackBar(content: new Text("please enter your user name ")));
//      });
//    }

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
              "distance covered": 0,
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
            print(e);
          });
        }).catchError((e) {
          print(e);
        });
      }).catchError((e) {
        print(e);
      });

      _scaffoldstate.currentState.showSnackBar(new SnackBar(
          content: new Text("Congutrlation account with email" +
              " " +
              email +
              " " +
              "is succefully created")));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SigninForm(),
        ),
      );
    }
  }
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

String _validatePassword(String value) {
  if (value.length > 5) {
    return null;
  }

  return 'Password must be up to 6 characters';
}

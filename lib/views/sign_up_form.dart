import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:budupdated/views/signin_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
        title: new Text('Sign up'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            Center(
              child: new Text(
                "Bud Sign Up Form",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 32.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onSubmitted: _onSubmitFirstName,
              onChanged: _onSubmitFirstName,
              controller: myController1,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(borderSide: BorderSide()),
                contentPadding: EdgeInsets.all(15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextField(
                onSubmitted: _onSubmitLastName,
                onChanged: _onSubmitLastName,
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
              child: TextField(
                onSubmitted: _onSubmitUserName,
                onChanged: _onSubmitUserName,
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
                  "Click to upload MSA id front image ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: TextField(
                onSubmitted: (value) {
                  if (value.endsWith("msa.edu.eg")) {
                    setState(() {
                      email = value.toLowerCase();
                    });
                  } else {
                    _scaffoldstate.currentState.showSnackBar(new SnackBar(
                        content: new Text("please enter  your MSA email")));
                    print("please enter valid MSA mail");
                  }
                },
                onChanged: (value) {
                  if (value.endsWith("msa.edu.eg")||value.endsWith("MSA.EDU.EG")) {
                    setState(() {
                      email = value;
                    });
                  }
                },
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderSide: BorderSide()),
                contentPadding: EdgeInsets.all(15.0),
              ),
              onChanged: (value) {
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
    // we need later here to replace Mohab name with the user signed in inside our
    // system to easily identify each driver photos
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
    if (firstname == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your firstname")));
      });
    }
    if (lastName == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your lastname")));
      });
    }
    if (password == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your password")));
      });
    }

    if (email == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter valid MSA email")));
      });
    }

    if (userName == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your user name ")));
      });
    }

//    if (imageFiles == null) {
//      setState(() {
//        _scaffoldstate.currentState.showSnackBar(new SnackBar(
//            content: new Text("please upload the front id image  ")));
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

        Firestore.instance.collection('users').document(email.toLowerCase()).setData({
          'email': signedInUser.email.toLowerCase(),
          'uid': signedInUser.uid,
          "First Name ": firstname,
          "Last Name": lastName,
          "Number Of Rides As Driver": 0,
          "passengerrate":0.0001,
          "driverrate":0.0001,
          "CO2 saved":0,
          "Number Of Rides As guest":0,
          "distance covered":0,
          "Driver authnticated": false,
        });


        Firestore.instance.collection('Achievements').document(email).setData({
          'email': signedInUser.email,
          'first ride': false,
          'third ride': false,
          "fifth ride": false,
          "10 ride": false,
          "20 ride": false,
          "30 ride": false,
          "40 ride":false,
          "50 ride":false,
          "60 ride":false,
          "70 ride":false,
          "80 ride":false,
          "90 ride":false,
          "100 ride":false,
          "110 ride":false,
          "120 ride":false,
          "130vride":false,
          "140 ride":false,
          "150 ride":false,
          "160 ride":false,
          "170 ride":false,
          "180 ride":false,
          "190 ride":false,
          "200 ride":false,
          "210 ride":false,
          "220 ride":false,
          "0.5 ton":false,
          "1 ton":false,
          "2 ton":false,
          "3 ton":false,
          "4 ton":false,
          "5 ton":false,
          "6 ton":false,
          "7 ton":false,
          "8 ton":false,
          "9 ton":false,
          "10 ton":false,
          "11 ton":false,
          "12 ton":false,
          "13 ton":false,
          "14 ton":false,
          "15 ton":false,
          "16 ton":false,
          "17 ton":false,
          "18 ton":false,
          "19 ton":false,
          "20 ton":false,
          "21 ton":false,
          "22 ton":false,
          "23 ton":false,
          "24 ton":false,
          "25 ton":false,
          "26 ton":false,
          "27 ton":false,
          "28 ton":false,
          "29 ton":false,
          "30 ton":false,

        });


        _scaffoldstate.currentState
            .showSnackBar(new SnackBar(content: new Text("Congutrlation account with email"+" "+email+" "+"is succefully created")));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SigninForm(),
          ),
        );
      }).catchError((e) {
        print(e);
        _scaffoldstate.currentState
            .showSnackBar(new SnackBar(content: new Text(e.toString())));
      });
    }
  }
}


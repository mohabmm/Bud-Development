import 'dart:io';
import 'dart:math';

import 'package:budupdated/views/enter_ride_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CheckDriverStatus extends StatefulWidget {
  FirebaseUser firebaseuser;

  CheckDriverStatus(this.firebaseuser);

  @override
  _CheckDriverStatusState createState() =>
      _CheckDriverStatusState(firebaseuser);
}

class _CheckDriverStatusState extends State<CheckDriverStatus> {
  bool Registiration = false;
  bool NationalID = false;
  bool DriverLiscenceFront = false;
  bool DriverLiscenceBack = false;
  FirebaseUser firebaseuser;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  _CheckDriverStatusState(this.firebaseuser);

  Future checkFirstSeen() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              if (doc["Driver authnticated"] == true) {
                print("the current driver status is " +
                    doc["Driver authnticated"].toString());
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new EnterRideDetails(user: firebaseuser)));
              } else {
                _scaffoldstate.currentState.showSnackBar(new SnackBar(
                    content: new Text(
                        "Please wait until your data is verfied in order to get access to offer ride in our app")));
              }
            }));
  }

  Future<String> _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final String fileName =
        "${Random().nextInt(1000000)}.jpg" + firebaseuser.displayName;
    StorageReference ref =
        FirebaseStorage.instance.ref().child(fileName + firebaseuser.email);
    StorageUploadTask uploadTask = ref.putFile(imageFile);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                "We just need a few more details",
                style: new TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10.0),
              child: new Text(
                "To drive with BUD you need to be a student or a member stuff at MSA university so please fill this data and we will let you offer ride once we check your data ",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: new Divider(
                color: Colors.black,
              ),
            ),
            new FlatButton(
                onPressed: () {
                  Registiration = true;
                  _pickSaveImage();
                },
                child: new Text("Car Registiration Document")),
            new FlatButton(
                onPressed: () {
                  NationalID = true;
                  _pickSaveImage();
                },
                child: new Text("National ID")),
            new Divider(
              color: Colors.black,
            ),
            new FlatButton(
                onPressed: () {
                  DriverLiscenceFront = true;
                  _pickSaveImage();
                },
                child: new Text("Driver license Front")),
            new FlatButton(
                onPressed: () {
                  DriverLiscenceBack = true;
                  _pickSaveImage();
                },
                child: new Text("Driver license Back")),
            new Divider(),
            new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      if (Registiration == false) {
                        print("Please upload Car Registiration Document");
                        _scaffoldstate.currentState.showSnackBar(new SnackBar(
                            content: new Text(
                                "Please upload Car Registiration document")));
                      }
                      if (NationalID == false) {
                        print("Please upload National ID");

                        _scaffoldstate.currentState.showSnackBar(new SnackBar(
                            content: new Text("Please upload National ID")));
                      }
                      if (DriverLiscenceFront == false) {
                        _scaffoldstate.currentState.showSnackBar(new SnackBar(
                            content: new Text(
                                "Please upload Driver license Front")));
                        print("Please upload Driver Liscence Front");
                      }
                      if (DriverLiscenceBack == false) {
                        print("Please upload Driver license Back");
                        _scaffoldstate.currentState.showSnackBar(new SnackBar(
                            content:
                                new Text("Please upload Driver license Back")));
                      }

                      if (Registiration != false &&
                          NationalID != false &&
                          DriverLiscenceFront != false &&
                          DriverLiscenceBack != false) {
                        checkFirstSeen();
                      }
                    },
                    child: new Text("Next"),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

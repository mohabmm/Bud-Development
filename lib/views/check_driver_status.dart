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
  FirebaseUser user;
  CheckDriverStatus(this.user);
  @override
  _CheckDriverStatusState createState() => _CheckDriverStatusState(user);
}

class _CheckDriverStatusState extends State<CheckDriverStatus> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  FirebaseUser user;

  _CheckDriverStatusState(this.user);

  Future<String> _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    // we need later here to replace Mohab name with the user signed in inside our
    // system to easily identify each driver photos
    final String fileName =
        "${Random().nextInt(1000000)}.jpg" + user.displayName;
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = ref.putFile(imageFile);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10.0),
              child: new Text(
                  "to drive with bud you need to be a student or a member stuff at MSA university so please fill this data and we will let you offer ride once we checked your data  "),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: new Divider(
                color: Colors.black,
              ),
            ),
            new FlatButton(
                onPressed: () {
                  button1 = true;
                  _pickSaveImage();
                },
                child: new Text("Registiration")),
//            new FlatButton(
//                onPressed: () {}, child: new Text("Criminal Record")),
            new FlatButton(
                onPressed: () {
                  button2 = true;
                  _pickSaveImage();
                },
                child: new Text("National ID")),
            new Divider(
              color: Colors.black,
            ),
            new FlatButton(
                onPressed: () {
                  button3 = true;
                  _pickSaveImage();
                },
                child: new Text("Driver Liscence Front")),
            new FlatButton(
                onPressed: () {
                  button4 = true;
                  _pickSaveImage();
                },
                child: new Text("Driver Liscence Back")),
            new Divider(),
            new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      if (button1 == false) {
                        print("please print button1");
                      }
                      if (button2 == false) {
                        print("please press button2");
                      }
                      if (button3 == false) {
                        print("please press button3");
                      }
                      if (button4 == false) {
                        print("please press button4");
                      }

                      //TODO 1) HERE I NEED TO CHECK THE VALUE OF Driver authnticated if it is true user

                      // can navigate to next screen as the
                      if (button1 != false &&
                          button2 != false &&
                          button3 != false &&
                          button4 != false) {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new EnterRideDetails(user: user)));
                      }
                    },
                    child: new Text("next"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('users')
                            .where("email", isEqualTo: user.email)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            bool status = snapshot
                                .data.documents[0].data['Driver authnticated'];
                            return Row(children: <Widget>[
                              new Text("Current Submtion Status:"),
                              new Text(status.toString()),
                            ]);
                          }
                        }),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}

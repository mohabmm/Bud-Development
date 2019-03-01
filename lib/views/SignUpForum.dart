import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupForum extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SignupForum> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();

  String firstname;
  String lastName;
  String phoneNumber;
  String email;
  String userName;

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final signupColor = const Color(0xFF3d3d3d);

    File image;

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
                "Bud Sign Up Forum",
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
                  //_pickSaveImage();
                },
                child: new Text(
                  "Click to upload MSA id front image ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            TextField(
              onSubmitted: _onSubmitPhoneNumber,
              onChanged: _onSubmitPhoneNumber,
              keyboardType: TextInputType.numberWithOptions(),
              controller: myController3,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderSide: BorderSide()),
                contentPadding: EdgeInsets.all(15.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: TextField(
                onSubmitted: _onSubmitEmail,
                onChanged: _onSubmitEmail,
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
//  Future<Uri> _pickSaveImage() async {
//    imageFiles = await ImagePicker.pickImage(source: ImageSource.camera);
//    StorageReference ref = FirebaseStorage.instance.ref().child("image.jpg");
//    StorageUploadTask uploadTask = ref.putFile(imageFiles);
//    return (await uploadTask.future).downloadUrl;
//  }

  void _onSubmitPhoneNumber(String value) {
    setState(() {
      phoneNumber = value;
      print("the phone number the user wrote is " + phoneNumber);
    });
  }

  void _onSubmitUserName(String value) {
    setState(() {
      userName = value;
      print("the user Name " + phoneNumber);
    });
  }

  void _onSubmitEmail(String value) {
    setState(() {
      email = value;
      print("the email the user wrote is " + email);
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

    if (phoneNumber == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter the phone number")));
      });
    }
    if (email == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your mail")));
      });
    }

    if (userName == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your user name ")));
      });
    }

    if (imageFiles == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please upload the front id image  ")));
      });
    }
    if (firstname != null &&
        lastName != null &&
        phoneNumber != null &&
        imageFiles != null &&
        email != null &&
        userName != null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("Uploading your trip data ")));

        var items = <String, dynamic>{
          "First Name ": firstname,
          "Last Name": lastName,
          "Phone Number": phoneNumber,
          "Email": email,
          "User Name": userName,
        };

        DatabaseReference reference = FirebaseDatabase.instance
            .reference()
            .child("Users Signed up")
            .push();
        reference.set(items);

        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text(
                "Thanks for filling the forum we will get back to you in maximum 3 days ")));
      });
    }
  }
}

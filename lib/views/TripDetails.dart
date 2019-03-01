import 'package:budupdated/HomePage.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  FirebaseUser user;
  MyApp({@required this.user});

  @override
  _State createState() => new _State(user: user);
}

class _State extends State<MyApp> {
  FirebaseUser user;

  _State({this.user});

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  String currentdate;
  String describtion;
  String From;
  String To;
  String name;
  int counter;

  final dateFormat = new DateFormat.yMd().add_jm();
  final timeFormat = DateFormat("h:mm a");
  void _onSubmitdescribtion(String value) {
    setState(() => describtion = value);
    print("the value of describtion is " + describtion);
  }

  void _onSubmitFrom(String value) {
    setState(() {
      From = value;
      print("the data inside From in itstate is " + From);
    });
  }

  void _onSubmitTo(String value) {
    setState(() => To = value);
    print("the value of To is " + To);
  }

  void _onSubmitName(String value) {
    setState(() => name = value);
    print("the value of To is " + name);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        key: _scaffoldstate,
        appBar: new AppBar(
          title: new Text('BUD'),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                            user: user,
                          ),
                    ),
                  )),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new ListView(
            children: <Widget>[
              TextField(
                onSubmitted: _onSubmitName,
                onChanged: _onSubmitName,
                controller: myController5,
                decoration: InputDecoration(
                  labelText: 'User name',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                onSubmitted: _onSubmitFrom,
                onChanged: _onSubmitFrom,
                controller: myController1,
                decoration: InputDecoration(
                  labelText: 'From',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: myController2,
                onSubmitted: _onSubmitTo,
                onChanged: _onSubmitTo,
                decoration: InputDecoration(
                  labelText: 'To',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
//                  Expanded(
//                    child:
////
//                  InkWell(
//                    child:
//
                  DateTimePickerFormField(
                    format: dateFormat,
                    initialTime: TimeOfDay.now(),
                    autovalidate: true,
                    firstDate: DateTime.now(),
                    onSaved: (date) {
                      setState(() {
                        currentdate = date.toString();
                        print("the data is " + currentdate);
                      });
                    },
                    onChanged: (date) {
                      setState(() {
                        currentdate = date.toString();
                        print("the data is " + currentdate);
                      });
                    },
                    controller: myController3,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    //                ),
                  ),
//                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: myController4,
                  onSubmitted: _onSubmitdescribtion,
                  onChanged: _onSubmitdescribtion,
                  decoration: InputDecoration(
                    labelText: 'Describtion',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              new Text("seats"),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FloatingActionButton(
                        backgroundColor: Colors.blue,
                        heroTag: "press1",
                        child: Text("1"),
                        onPressed: button1_pressed),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FloatingActionButton(
                      backgroundColor: Colors.blue,
                      heroTag: "press2",
                      child: Text("2"),
                      onPressed: button2_pressed,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FloatingActionButton(
                      backgroundColor: Colors.blue,
                      heroTag: "press3",
                      child: Text("3"),
                      onPressed: button3_pressed,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new FloatingActionButton(
                      backgroundColor: Colors.blue,
                      heroTag: "press4",
                      child: Text("4"),
                      onPressed: button4_pressed,
                    ),
                  ),
                ],
              ),

              new RaisedButton(
                onPressed: upload,
                child: Text("Submit"),
              ) //............
            ],
          ),
        ),
      ),
    );
  }

  void button1_pressed() {
    setState(() {
      counter = 1;
    });
  }

  void button2_pressed() {
    setState(() {
      counter = 2;
    });
  }

  void button3_pressed() {
    setState(() {
      counter = 3;
    });
  }

  void button4_pressed() {
    setState(() {
      counter = 4;
    });
  }

  void upload() {
    if (currentdate == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please choose the time of the trip")));
      });
    } else {
      print("the current date inside upload is " + currentdate);
    }
    if (describtion == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please write brief describtion")));
      });
    } else {
      print("the current describtion is " + describtion);
    }
    if (From == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please select your current location")));
      });
    } else {
      print("the current data From is " + From);
    }
    if (To == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please select destination place")));
      });
    } else {
      print("the current data TO to  to is " + To);
    }

    if (counter == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please sepecfy number of people ")));
      });
    } else {
      print("the current number of seats is  " + counter.toString());
    }

    if (name == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter your name  ")));
      });
    } else {
      print("the registered name is   " + name.toString());
    }

    if (currentdate != null &&
        describtion != null &&
        From != null &&
        To != null &&
        counter != null &&
        name != null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("upoading your trip data ")));

        var items = <String, dynamic>{
          "Trip Date": currentdate,
          //.replaceAll(":00.000", ''),
          "describtion": describtion,
          "From": From,
          "To": To,
          "No Of Seats": counter,
          "User name": name,
        };

        // here we push data to offer ride list
        //TODO change this part to upload to firestore collection
        DatabaseReference reference = FirebaseDatabase.instance
            .reference()
            .child("Offer Ride list")
            .push();
        reference.set(items);
      });
    }
  }
}

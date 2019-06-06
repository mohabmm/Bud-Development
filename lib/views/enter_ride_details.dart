import 'dart:math';

import 'package:budupdated/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnterRideDetails extends StatefulWidget {
  FirebaseUser user;

  EnterRideDetails({this.user});

  @override
  _State createState() => new _State(user: user);
}

class _State extends State<EnterRideDetails> {
  FirebaseUser user;

  _State({this.user});

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  final myController8 = TextEditingController();
  final myController9 = TextEditingController();

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  String firstletterfrom;
  String firstletterto;
  String Telephone;
  String currentdate;
  String describtion;
  String From;
  String To;
  String name;
  int counter;
  String carType;
  bool ridestatus;
  String carColor;
  int number_of_ridesasDriver;
  String carNumber;
  final dateFormat = new DateFormat.yMd().add_jm();
  final timeFormat = DateFormat("h:mm a");

  void _onSubmitdescribtion(String value) {
    setState(() => describtion = value);
    print("the value of describtion is " + describtion);
  }

  void _onSubmitFrom(String value) {
    setState(() {
      From = value.substring(0, 1).toUpperCase() + value.substring(1);
      firstletterfrom = value.substring(0, 1).toUpperCase();
      print("the data inside From in itstate is " + From);
    });
  }

  void _onSubmittelephone(String value) {
    setState(() {
      Telephone = value;
      print("the data inside telephone " + From);
    });
  }

  void _onSubmitcarColor(String value) {
    setState(() {
      carColor = value;
      print("the data inside From in itstate is " + carColor);
    });
  }

  Future getnumberofridesasdriver() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: user.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              number_of_ridesasDriver = doc.data['Number Of Rides As Driver'];
              print("iam in old screen ");
              print("the current number of rides as driver is" +
                  number_of_ridesasDriver.toString());
            }));
  }

  @override
  void initState() {
    super.initState();
    getnumberofridesasdriver();
  }

  void _onSubmitcarNumber(String value) {
    setState(() {
      carNumber = value;
      print("the data inside From in itstate is " + carNumber);
    });
  }

  void _onSubmitTo(String value) {
    setState(() {
      To = value.substring(0, 1).toUpperCase() + value.substring(1);
      firstletterto = value.substring(0, 1).toUpperCase();
      print("the first letter to is" + firstletterto);
    });

    print("the value of To is " + To);
  }

  void _onSubmitdcarType(String value) {
    setState(() => carType = value);
    print("the value of To is " + carType);
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
          padding: new EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: new ListView(
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "Offer Ride",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              )),
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
                onSubmitted: _onSubmittelephone,
                onChanged: _onSubmittelephone,
                controller: myController9,
                decoration: InputDecoration(
                  labelText: 'Telephone Number',
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

              DateTimePickerFormField(
                inputType: inputType,
                initialTime: TimeOfDay.now(),
                firstDate: DateTime.now(),
                format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                editable: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Date/Time',
                    hasFloatingPlaceholder: false),
                onChanged: (date) {
                  setState(() {
                    currentdate = date.day.toString() +
                        "/" +
                        date.month.toString() +
                        "/" +
                        date.year.toString() +
                        " " +
                        date.hour.toString() +
                        ":" +
                        date.minute.toString();
                    print("the data is " + currentdate);
                  });
                },
                onSaved: (date) {
                  setState(() {
                    currentdate = date.toString();
                    print("the data is " + currentdate);
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: myController4,
                onSubmitted: _onSubmitdescribtion,
                onChanged: _onSubmitdescribtion,
                decoration: InputDecoration(
                  labelText: 'Describtion',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: myController6,
                onSubmitted: _onSubmitdcarType,
                onChanged: _onSubmitdcarType,
                decoration: InputDecoration(
                  labelText: 'Car Type',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              TextField(
                controller: myController7,
                onSubmitted: _onSubmitcarNumber,
                onChanged: _onSubmitcarNumber,
                decoration: InputDecoration(
                  labelText: 'Car Number',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              TextField(
                controller: myController8,
                onSubmitted: _onSubmitcarColor,
                onChanged: _onSubmitcarColor,
                decoration: InputDecoration(
                  labelText: 'Car Color',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
              Center(
                  child: new Text(
                "Please choose number of seats",
                style:
                    new TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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

    if (carType == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please choose car type")));
      });
    } else {
      print("the current car type is " + currentdate);
    }

    if (Telephone == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enter Telephone number")));
      });
    } else {
      print("the current telephone number is " + currentdate);
    }

    if (carColor == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please choose the car color")));
      });
    } else {
      print("the car color date inside upload is " + currentdate);
    }

    if (carNumber == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please choose  car number ")));
      });
    } else {
      print("the current car number inside upload is " + currentdate);
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

    _scaffoldstate.currentState.showSnackBar(
        new SnackBar(content: new Text("Uploading your trip data ")));

    Random rnd;
    int min = 1;
    int max = 100000000;
    rnd = new Random();
    int id;
    id = min + rnd.nextInt(max - min);

    // here in this part we need to inscrease number of rides
    // as driver inside the app

    if (currentdate != null &&
        carType != null &&
        Telephone != null &&
        carColor != null &&
        carNumber != null &&
        describtion != null &&
        From != null &&
        To != null &&
        counter != null &&
        name != null) {
      Firestore.instance
          .collection('Offer Ride list')
          .document(id.toString())
          .setData({
        "Trip Date": currentdate.replaceAll(":00.000", ''),
        "describtion": describtion,
        "From": From,
        "To": To,
        "No Of Seats": counter,
        "User name": name,
        "CarType": carType,
        "Telephone": Telephone,
        "CarColor": carColor,
        "CarNumber": carNumber,
        "Ride Owner": user.email,
        "RideId": id,
        "RideStatus": false,
        "GusestUser": "",
        "RideFinished": false,
        "SearchFrom": firstletterfrom,
        "SearchTo": firstletterto,
      });

      Firestore.instance.collection('users').document(user.email).updateData({
        "Number Of Rides As Driver": number_of_ridesasDriver + 1,
      });
      //TODO here we need to read number of rides as driver again to reflect the latest update

      print("the current number of rides as driver now  after upate is " +
          number_of_ridesasDriver.toString());

      print("congurtlation new achievement is reached");
      if (number_of_ridesasDriver + 1 == 1) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "first ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 3) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "third ride as driver": true,
        });
      }

      if (number_of_ridesasDriver + 1 == 5) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "fifth ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 10) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "10 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 20) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "20 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 30) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "30 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 40) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "40 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 50) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "50 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 60) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "60 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 70) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "70 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 80) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "80 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 90) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "90 ride as driver": true,
        });
      }
      if (number_of_ridesasDriver + 1 == 100) {
        Firestore.instance
            .collection('Achievements')
            .document(user.email)
            .updateData({
          "100 ride as driver": true,
        });
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
                user: user,
              )));
    }
  }
}

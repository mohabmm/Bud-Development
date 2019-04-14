import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budupdated/homePage.dart';
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



  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  String currentdate;
  String describtion;
  String From;
  String To;
  String name;
  int counter;
  String carType;
  String carColor;
  String carNumber; 
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

  
  void _onSubmitcarColor(String value) {
    setState(() {
      carColor = value;
      print("the data inside From in itstate is " + carColor);
    });
  }


  

  void _onSubmitcarNumber(String value) {
    setState(() {
      carNumber = value;
      print("the data inside From in itstate is " + carNumber);
    });
  }
  void _onSubmitTo(String value) {
    setState(() => To = value);
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

              DateTimePickerFormField(
                inputType: inputType,
                initialTime: TimeOfDay.now(),
                firstDate: DateTime.now(),
                format: formats[1],
                editable: editable,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Date/Time',
                    hasFloatingPlaceholder: false),
                onChanged: (date) {
                  setState(() {
                    currentdate = date.toString();
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
                width: 10.0,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: myController6,
                  onSubmitted: _onSubmitdcarType,
                  onChanged: _onSubmitdcarType,
                  decoration: InputDecoration(
                    labelText: 'Car Type',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: myController7,
                  onSubmitted: _onSubmitcarNumber,
                  onChanged: _onSubmitcarNumber,
                  decoration: InputDecoration(
                    labelText: 'Car Number',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              
Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: myController8,
                  onSubmitted: _onSubmitcarColor,
                  onChanged: _onSubmitcarColor,
                  decoration: InputDecoration(
                    labelText: 'Car Color',
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


      if (carType == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please choose car type")));
      });
    } else {
      print("the current car type is " + currentdate);
    }

      if (carColor == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please choose the car color")));
      });
    } else {
      print("the car color date inside upload is " + currentdate);
    }

      if (carNumber == null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text("please choose  car number ")));
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


   // String carType;
  //String carColor;
  //String carNumber; 

    if (currentdate != null &&
    
    carNumber != null &&
    carColor != null &&
    carType != null &&
        describtion != null &&
        From != null &&
        To != null &&
        counter != null &&
        name != null) {
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("Uploading your trip data ")));

        Firestore.instance.collection('Offer Ride list').document().setData({
          "Trip Date": currentdate.replaceAll(":00.000", ''),
          "describtion": describtion,
          "From": From,
          "To": To,
          "No Of Seats": counter,
          "User name": name,
          "CarType":carType,
          "CarColor":carColor,
          "CarNumber":carNumber
        });
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(
              user: user,
            )));
      });
    }
  }
}

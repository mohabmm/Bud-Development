import 'package:budupdated/views/check_driver_status.dart';
import 'package:budupdated/views/enter_ride_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Trip extends StatefulWidget {
  FirebaseUser user;

  Trip({this.user});
  @override
  _State createState() => new _State(user: user);
}

class _State extends State<Trip> {
  FirebaseUser user;

  _State({this.user});

  final color = const Color(0xFF13DDD2);

//  @override
//  void initState() {
//    super.initState();
//    checkFirstSeen();
//  }
//
  Future checkFirstSeen() async {
    //Firestore.instance.collection("users").snapshots();

    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: user.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              if (doc["Driver authnticated"] == true) {
                print("the current driver status is " +
                    doc["Driver authnticated"].toString());
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new EnterRideDetails(user: null)));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckDriverStatus(user)));
              }
            }

                //print(doc["Driver authnticated"].toString() + "a7a")
                ));
    // here we need to read the data from firestore
    //if the authntication is true  then the driver have ability to offer ride
    //EnterRideDetails

    //*******************************************//
    // if the authntication is false then he has to
    // go to check driver status
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        backgroundColor: color,
        onPressed: () {
          checkFirstSeen();
//
        },
        //TODO YA MOHAAAAA
        // here we must show The Shared pref if the value is false
        //navigate to the temp screen else navigate to OneTimeDriver screen
        //else navigate to TripDataDetails
        tooltip: 'add new trip',
        child: new Icon(Icons.add),
      ), //

      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Offer Ride list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemExtent: 220.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  String from =
                      snapshot.data.documents[index].data['From'].toString();
                  String To =
                      snapshot.data.documents[index].data['To'].toString();

                  String Trip_date = snapshot
                      .data.documents[index].data['Trip Date']
                      .toString();

                  String name = snapshot.data.documents[index].data['User name']
                      .toString();

                  return new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(name),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Text(
                                    from,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: new IconButton(
                                    icon: new Icon(Icons.arrow_forward),
                                    onPressed: () => print("hello moha"),
                                  ),
                                ),
                                Expanded(
                                  child: new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 0.0, 16.0),
                                    child: new Text(
                                      To,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(70.0, 12.0, 0.0, 0.0),
                            child: new Row(
                              // make buttons use the appropriate styles for cards

                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 6.0),
                                    child: new Text(
                                      Trip_date,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

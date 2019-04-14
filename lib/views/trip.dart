import 'package:budupdated/views/card_details.dart';
import 'package:budupdated/views/check_driver_status.dart';
import 'package:budupdated/views/enter_ride_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  FirebaseUser user;

  Trip({this.user});
  @override
  _State createState() => new _State(firebaseuser: user);
}

class _State extends State<Trip> {
  FirebaseUser firebaseuser;

  _State({this.firebaseuser});

  final color = const Color(0xFF13DDD2);

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckDriverStatus(firebaseuser)));
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: color,
        onPressed: () {
          checkFirstSeen();
        },
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



                  String carnumber =
                      snapshot.data.documents[index].data['CarNumber'].toString();

                  String cartype =
                      snapshot.data.documents[index].data['CarType'].toString();

                  String carcolor =
                      snapshot.data.documents[index].data['CarColor'].toString();

                  String NoOfSeats = snapshot
                      .data.documents[index].data['No Of Seats']
                      .toString();
                  String To =
                      snapshot.data.documents[index].data['To'].toString();

                  String Trip_date = snapshot
                      .data.documents[index].data['Trip Date']
                      .toString();

                  String username = snapshot.data.documents[index].data['User name']
                      .toString();
                  String describtion = snapshot
                      .data.documents[index].data['describtion']
                      .toString();

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new CardDetails(
                              firebaseuser,
                              username,
                              describtion,
                              from,
                              To,
                              Trip_date,
                              NoOfSeats,
                            carnumber,
                            cartype,
                            carcolor,

                          )));
                    },
                    child: new Card(
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(username),
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
                              padding: const EdgeInsets.fromLTRB(
                                  70.0, 12.0, 0.0, 0.0),
                              child: new Row(
                                // make buttons use the appropriate styles for cards

                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
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
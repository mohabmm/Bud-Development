import 'package:budupdated/ui/views/card_details.dart';
import 'package:budupdated/ui/views/enter_ride_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trip extends StatelessWidget {
  FirebaseUser user;

  final color = const Color(0xFF13DDD2);

  bool haspremition;
  Trip(this.user);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: "btn5",
        backgroundColor: color,
        onPressed: () {
          if (haspremition) {
            Navigator.pushNamed(context, 'enterridedetails');
          } else {
            Navigator.pushNamed(context, 'checkDriverStatus');
          }
          //
          //  checkFirstSeen();
        },
        tooltip: 'add new trip',
        child: new Icon(Icons.add),
      ), //

      //Todo here i want to re read the ride data from my model
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Offer Ride list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemExtent: 220.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  String from =
                      snapshot.data.documents[index].data['From'].toString();

                  int id = snapshot.data.documents[index].data['RideId'];

                  String userimage = snapshot
                      .data.documents[index].data['userimage']
                      .toString();

                  String Telephone = snapshot
                      .data.documents[index].data['Telephone']
                      .toString();
                  bool ridefinished =
                      snapshot.data.documents[index].data['RideFinished'];
                  String carnumber = snapshot
                      .data.documents[index].data['CarNumber']
                      .toString();

                  String cartype =
                      snapshot.data.documents[index].data['CarType'].toString();

                  String carcolor = snapshot
                      .data.documents[index].data['CarColor']
                      .toString();

                  int NoOfSeats =
                      snapshot.data.documents[index].data['No Of Seats'];

                  String To =
                      snapshot.data.documents[index].data['To'].toString();

                  bool ridestatus =
                      snapshot.data.documents[index].data['RideStatus'];

                  String Trip_date = snapshot
                      .data.documents[index].data['Trip Date']
                      .toString();

                  String rideownerusername = snapshot
                      .data.documents[index].data['User name']
                      .toString();
                  String describtion = snapshot
                      .data.documents[index].data['describtion']
                      .toString();

                  String rideowneremail = snapshot
                      .data.documents[index].data['Ride Owner']
                      .toString();
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new CardDetails(
                              id,
                              user,
                              rideownerusername,
                              describtion,
                              from,
                              To,
                              Trip_date,
                              NoOfSeats,
                              carnumber,
                              cartype,
                              carcolor,
                              Telephone,
                              ridestatus,
                              ridefinished,
                              rideowneremail,
                              userimage)));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        child: Material(
                          color: Colors.white,
                          elevation: 14.0,
                          borderRadius: BorderRadius.circular(24.0),
                          shadowColor: Color(0x802196F3),
                          child: Row(
                            children: <Widget>[
                              new Expanded(
                                child: Container(
                                    child: new Container(
                                  child: new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0.0),
                                          child: Row(
                                            children: <Widget>[
                                              new Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: new BoxDecoration(
                                                  color:
                                                      const Color(0xff7c94b6),
                                                  image: new DecorationImage(
                                                    image: new NetworkImage(
                                                        userimage),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              50.0)),
                                                  border: new Border.all(
                                                    color: Colors.white,
                                                    width: 4.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18.0),
                                                  child: new Text(
                                                    from,
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: new IconButton(
                                                  icon: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 60.0),
                                                      child: new Icon(
                                                        Icons.arrow_forward,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () =>
                                                      print("hello moha"),
                                                ),
                                              ),
                                              Expanded(
                                                child: new Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  child: new Text(
                                                    //To,
                                                    To,
                                                    style: new TextStyle(
                                                      fontSize: 23.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 6.0, left: 30.0),
                                              child: new Text(
                                                rideownerusername,
                                                style: new TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0, right: 28.0),
                                              child: Text(
                                                Trip_date,
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
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

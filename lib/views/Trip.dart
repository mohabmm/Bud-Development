import 'package:budupdated/views/TripData.dart';
import 'package:budupdated/views/TripDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  List<TripData> allData = [];

  @override
  void initState() {
    allData.clear();
    // here we read from offer ride list
    //TODO change this part to read from the new collection
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref
        .child('Offer Ride list')
        .orderByChild('timestamp')
        .once()
        .then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      for (var key in keys) {
        TripData d = new TripData(
          data[key]['From'],
          data[key]['No Of Seats'],
          data[key]['To'],
          data[key]['Trip Date'].replaceAll(":00.000", ''),
          data[key]['Describtion'],
          data[key]['User name'],
        );
        //  allData.add(d);

        setState(() {
          print("i'm initstate bitchessssssssss");
          allData.add(d);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(
          backgroundColor: color,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyApp(
                    user: user,
                  ))),
          tooltip: 'add new trip',
          child: new Icon(Icons.add),
        ), //

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: allData.length == 0
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (_, index) {
                      return UI(
                        allData[index].From,
                        allData[index].No_Of_Seats,
                        allData[index].To,
                        allData[index].Trip_Date,
                        allData[index].describtion,
                        allData[index].name,
                      );
                    },
                  ),
          ),
        ));
  }

  Widget UI(
      String from, int no_0f_seats, String To, Trip_date, describtion, name) {
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
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 16.0),
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
              padding: const EdgeInsets.fromLTRB(70.0, 12.0, 0.0, 0.0),
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
  }
}

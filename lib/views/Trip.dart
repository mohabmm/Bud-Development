import 'package:budupdated/views/TripData.dart';
import 'package:budupdated/views/TripDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

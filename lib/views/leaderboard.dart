import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text:"Heroes"),
                Tab(text:"Buds"),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('users')
                    .where("driverrate", isGreaterThan: "1").orderBy('driverrate', descending: true).limit(10).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents.map((DocumentSnapshot document) {
                          return new ListTile(
                            title: Center(child: new Text(document['First Name '])),
//                              subtitle: new Text(document['author']),
                          );
                        }).toList(),
                      );
                  }
                },
              ),//
              //this one is for buds
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('users')
                  .where("passengerrate", isGreaterThan: "1").orderBy('passengerrate', descending: true).limit(10).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents.map((DocumentSnapshot document) {
                          return new ListTile(
                            title: Center(child: new Text(document['First Name '])),
//                              subtitle: new Text(document['author']),
                          );
                        }).toList(),
                      );
                  }
                },
              ),//              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

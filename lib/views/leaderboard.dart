import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> with SingleTickerProviderStateMixin {
  int _selectedIndex0 = 0;
  int _selectedIndex1 = 1;
  int _selectedIndex2 = 2;


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
                    .where("driverrate", isGreaterThan: "0").orderBy('driverrate', descending: true).limit(10).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


//                  String name =
//                  snapshot.data.documents[0].data['First Name '];
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return new Text('Loading...');
                    default:
                      return ListView.builder(
                        itemExtent: 150.0,
                        itemCount: snapshot.data.documents.length,

    itemBuilder: (BuildContext context, int index) {
                        String name =
                  snapshot.data.documents[index].data['First Name '];
                        int numberofridesdriver = snapshot.data.documents[index].data['Number Of Rides As Driver'];
                        String co2driver = snapshot.data.documents[index].data['CO2driver'];
                        String driverrate = snapshot.data.documents[index].data['driverrate'];





                        return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16.0),
              child: Container(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(18.0),
                  shadowColor: Color(0x802196F3),
                    child:ListTile(
                                    title:
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[



                                              new Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: new BoxDecoration(
                                                  color: const Color(
                                                      0xff7c94b6),
                                                  image: new DecorationImage(

                                                    image:
                                                    new NetworkImage(
                                                        'http://i.imgur.com/QSev0hg.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                  new BorderRadius.all(
                                                      new Radius
                                                          .circular(
                                                          50.0)),
                                                  border: new Border.all(
                                                    color: Colors.white,
                                                    width: 4.0,
                                                  ),
                                                ),
                                              ),
                                              new Text(driverrate),


                                          Padding(
                                            padding: const EdgeInsets
                                                .only(
                                                bottom:30.0 ,
                                                left: 7.0),


                                            child: Center(
                                              child: new Text(
                                                name,
                                                style: new TextStyle(
                                                  fontWeight: FontWeight
                                                      .bold,
                                                  fontSize: 23.0,
                                                  color: Colors
                                                      .black,
                                                ),
                                              ),
                                            ),
                                          ),

//         :new Text("a7a"),
                                        ],
                                      ),
                                    ),
//                                  ],
//
//                                    ),
                                    subtitle: Column(
                                      children: <Widget>[
                                        new Text(numberofridesdriver.toString()+ "rides given"),
                                        new Text(co2driver+"KG C02 saved"),
                                      ],
                                    ),

                                  ),





                ),
              ),

            ),


          ],

        ),
      );

    }
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
                      return       new ListView.builder(
                          itemExtent: 220.0,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            String email =
                            snapshot.data.documents[index].data['email'].toString();
                            String name =
                            snapshot.data.documents[index].data['First Name '].toString();
                            return Column(
                              children: <Widget>[
                                new Image.network(
                                  "http://i.imgur.com/QSev0hg.jpg",
                                  fit: BoxFit.fill,
                                  height: 201.0,
                                  width: double.infinity,
                                ),
                                new Text(
                                  email,
                                ),

//                                new Text(
//                                  email,
//                                ),
                              ],
                            );
                          });
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

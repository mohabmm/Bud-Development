import 'package:budupdated/views/achievements.dart';
import 'package:budupdated/views/card_details.dart';
import 'package:budupdated/views/leaderboard.dart';
import 'package:budupdated/views/searchservice.dart';
import 'package:budupdated/views/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  FirebaseUser user;

  HomePage({@required this.user});

  @override
  _HomePageState createState() => new _HomePageState(user: user);
}

class _HomePageState extends State<HomePage> {
  FirebaseUser user;

  Widget appBarTitle = new Text(
    "BUD",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();

  bool _isSearching;

  var queryResultSet = [];
  var tempSearchStore = [];

  _HomePageState({this.user});

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xFF13DDD2);

    return new Scaffold(
        appBar: buildAppBar(context),
        drawer: new Drawer(
          child: Container(
            color: color,
            child: Center(
              child: new ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: new ListTile(
                        title: new Text(
                          "Wallet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        onTap: () {
                          // Navigator.of(context).pop();
                          // Navigator.of(context).push(new MaterialPageRoute(
                          //   builder: (BuildContext context) =>
                          // new MainProfile(widget.user)));
                        }),
                  ),
                  new ListTile(
                      title: new Text(
                        "Leaderboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new Leaderboard()));
                      }),
                  new ListTile(
                      title: new Text(
                        "Achievements",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Achievements(
                                  user,
                                )));
                      }),
                  new ListTile(
                      title: new Text(
                        "Trip History",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new HomePage(
                                  user: user,
                                )));
                      }),
                  new Divider(),
                  new ListTile(
                    title: new Text(
                      "Report a Problem",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  new ListTile(
                    title: new Text(
                      "About Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  new ListTile(
                    title: new Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: (queryResultSet.length != 0 ||
//                _controller.text.isNotEmpty ||
                tempSearchStore.length != 0)
            ? ListView(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 10.0),
                Column(
                    children: tempSearchStore.map((element) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new CardDetails(
                                element['RideId'],
                                user,
                                element['User name'],
                                element['describtion'],
                                element['From'],
                                element['To'],
                                element['Trip Date'],
                                element['No Of Seats'],
                                element['CarNumber'],
                                element['CarType'],
                                element['CarColor'],
                                element['Telephone'],
                                element['RideStatus'],
                                element['RideFinished'],
                                element['Ride Owner'])));
                      },

//
//                      id,
//                      loggedinuser,
//                      rideownerusername,
//                      describtion,
//                      from,
//                      To,
//                      Trip_date,
//                      NoOfSeats,
//                      carnumber,
//                      cartype,
//                      carcolor,
//                      Telephone,
//                      ridestatus,
//                      ridefinished,
//                      rideowneremail

                      child: buildResultCard(element));
                }).toList())
              ])
            : new Center(
                child: new Trip(loggedinuser: widget.user),
              ));
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    // for one letter suggestion part
    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().Serachto(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }

        print("the current data in the serach result from is " +
            queryResultSet.toString());
        print("the lenghth is " + queryResultSet.length.toString());
      });

      SearchService().Serachfrom(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }

        print("the current data in the serach result to is " +
            queryResultSet.toString());
        print("the lenghth is " + queryResultSet.length.toString());
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['To'].startsWith(capitalizedValue) ||
            element['From'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "BUD",
        style: new TextStyle(color: Colors.black),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
//            queryResultSet.clear();
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
//                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search, color: Colors.white),
                  hintText: "Serach For Rides",
                ),
                onChanged: (val) {
                  initiateSearch(val);
                },
              );
              _handleSearchStart();
            } else {
              setState(() {
                queryResultSet = [];
                tempSearchStore = [];
              });

              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }
}

Widget buildResultCard(data) {
  return Padding(
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
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Row(
                          children: <Widget>[
                            new Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'http://i.imgur.com/QSev0hg.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(50.0)),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: new Text(
                                  data['From'],
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
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
                                        const EdgeInsets.only(bottom: 60.0),
                                    child: new Icon(
                                      Icons.arrow_forward,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                                onPressed: () => print("hello moha"),
                              ),
                            ),
                            Expanded(
                              child: new Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: new Text(
//To,

                                  data['To'],
                                  style: new TextStyle(
                                    fontSize: 23.0,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 6.0, left: 30.0),
                            child: new Text(
                              data['User name'],
                              style: new TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 28.0),
                            child: Text(
                              data['Trip Date'],
                              style: TextStyle(fontSize: 18.0),
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
  );
}

Widget buildText(data) {
  return Center(
    child: Text(
      "No Results Found",
      style: TextStyle(fontSize: 32.0, color: Colors.black),
    ),
  );
}

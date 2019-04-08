import 'package:budupdated/views/trip.dart';
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

  _HomePageState({this.user});

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xFF13DDD2);

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(" Bud"),
          backgroundColor: color,
        ),
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
                        "Leaderboards",
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
                  new ListTile(
                      title: new Text(
                        "Achievemnts",
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
        body: new Center(
          child: new Trip(user: widget.user),
        ));
  }
}

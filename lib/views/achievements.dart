import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//IMPORTANT NOTE

// Suarez image means that the user have achieved the achievements

class Achievements extends StatefulWidget {
  FirebaseUser user;

  Achievements(this.user);

  @override
  _AchievementsState createState() => _AchievementsState(user);
}

class _AchievementsState extends State<Achievements> {
  FirebaseUser user;

  _AchievementsState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Achievements"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('Achievements')
                .where("email", isEqualTo: user.email)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              bool oneride = snapshot.data.documents[0].data['first ride'];
              print(
                  "the achievement that should shown is " + oneride.toString());
              if (!snapshot.hasData) {
                return Center(child: new Text("No Achievements Reached Yet"));
              }
              if (snapshot.hasError) {
                return new Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    print("the lenght is" +
                        snapshot.data.documents.length.toString());
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Stack(
                                                      children: [
                                                        BackdropFilter(
                                                          child: new Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: const Color(
                                                                  0xff7c94b6),
                                                              image: (oneride ==
                                                                      false)
                                                                  ? new DecorationImage(
                                                                      image: new NetworkImage(
                                                                          'http://i.imgur.com/QSev0hg.jpg'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    )
                                                                  : new DecorationImage(
                                                                      image: new NetworkImage(
                                                                          'https://futbolamateur.org/wp-content/uploads/2018/04/1467049.jpg_423682103-1024x1024.jpg'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                      .all(new Radius
                                                                          .circular(
                                                                      50.0)),
                                                              border: new Border
                                                                  .all(
                                                                color: Colors
                                                                    .white,
                                                                width: 4.0,
                                                              ),
                                                            ),
                                                          ),
                                                          filter:
                                                              ImageFilter.blur(
                                                            sigmaY: 5,
                                                            sigmaX: 5,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Reaches First  Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
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
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Reaches 3 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
//         :new Text("a7a"),
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Reaches 10 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "20 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "30 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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

                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "40 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "50 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "60 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "70 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "80 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "90 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "100 Rides in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "200 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "300 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "400 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "500 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "600 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "700 Ride in The app",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 1 ton of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 3 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 5 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 10 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
//                             Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 20 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 30 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 40 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 50 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 60 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 70 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 80 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 90 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 100 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                          Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: const Color(
                                                            0xff7c94b6),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'http://i.imgur.com/QSev0hg.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .all(new Radius
                                                                    .circular(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4.0),
                                                        child: new Text(
                                                          "Save 110 tons of CO2",
                                                          style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
//                             Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),Padding(padding: EdgeInsets.all(16.0),
//                               child: Container(
//                                 child: Material(
//                                   color: Colors.white,
//                                   elevation: 14.0,
//                                   borderRadius: BorderRadius.circular(24.0),
//                                   shadowColor: Color(0x802196F3),
//                                   child: Row(
//                                     children: <Widget>[
//                                       new Expanded(
//                                         child: Container(
//                                             child: new Container(
//                                               child: new Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   ListTile(
//                                                     subtitle: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           top: 0.0),
//                                                       child: Row(
//                                                         children: <Widget>[
//
//                                                           new Container(
//                                                             width: 100.0,
//                                                             height: 100.0,
//                                                             decoration: new BoxDecoration(
//                                                               color: const Color(
//                                                                   0xff7c94b6),
//                                                               image: new DecorationImage(
//                                                                 image:
//                                                                 new NetworkImage(
//                                                                     'http://i.imgur.com/QSev0hg.jpg'),
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                               borderRadius:
//                                                               new BorderRadius.all(
//                                                                   new Radius
//                                                                       .circular(
//                                                                       50.0)),
//                                                               border: new Border.all(
//                                                                 color: Colors.white,
//                                                                 width: 4.0,
//                                                               ),
//                                                             ),
//                                                           ),
////                                           X = COND ? A : B;
////                                                     oneride==true?
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                   .only(
//                                                                   left: 4.0),
//
//
//                                                               child: new Text(
//                                                                 "One Ride in The app",
//                                                                 style: new TextStyle(
//                                                                   fontWeight: FontWeight
//                                                                       .bold,
//                                                                   fontSize: 23.0,
//                                                                   color: Colors
//                                                                       .black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
////         :new Text("a7a"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ),
                        ],
                      ),
                    );
                }
              }
            }));
  }
}

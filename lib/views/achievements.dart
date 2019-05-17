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
              bool thirdride = snapshot.data.documents[0].data['third ride'];
              bool fifthride = snapshot.data.documents[0].data['fifth ride'];
              bool tenride = snapshot.data.documents[0].data['10 ride'];
              bool twentyride = snapshot.data.documents[0].data['20 ride'];
              bool thirtyride = snapshot.data.documents[0].data['30 ride'];
              bool fortyride = snapshot.data.documents[0].data['40 ride'];
              bool fiftyride = snapshot.data.documents[0].data['50 ride'];
              bool sixtyride = snapshot.data.documents[0].data['60 ride'];
              bool seventyride = snapshot.data.documents[0].data['70 ride'];
              bool eightyride = snapshot.data.documents[0].data['80 ride'];
              bool nintyride = snapshot.data.documents[0].data['90 ride'];
              bool hundredride = snapshot.data.documents[0].data['100 ride'];
              bool hundredten = snapshot.data.documents[0].data['110 ride'];
              bool hundredtwenty = snapshot.data.documents[0].data['120 ride'];
              bool hundrdthirty = snapshot.data.documents[0].data['130vride'];
              bool hundredforty = snapshot.data.documents[0].data['140 ride'];
              bool hundredfifty = snapshot.data.documents[0].data['150 ride'];
              bool hundredsixty = snapshot.data.documents[0].data['160 ride'];
              bool hundredseventy = snapshot.data.documents[0].data['170 ride'];
              bool hundredeighty = snapshot.data.documents[0].data['180 ride'];
              bool hundredninty = snapshot.data.documents[0].data['190 ride'];
              bool twohundredride = snapshot.data.documents[0].data['200 ride'];
              bool twohundredten = snapshot.data.documents[0].data['210 ride'];

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
                                                        new Container(
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
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (thirdride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://4.imimg.com/data4/EH/CI/MY-29481057/winner-trophy-cup-500x500.jpg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches Third  Ride in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (fifthride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://image.shutterstock.com/image-vector/isolated-realictic-soccer-gold-cup-450w-432985924.jpg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches Fifth  Ride in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (tenride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaklRrppkJku3S0PWMqcP6BkZHfj2_lShHHA_N-HXvQPTO90La'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 10  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (twentyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0_j_PQKrnLnjQUFZxn6joRZJuRjPNnsYMcVRuXoYeXQeLrNJC'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 20  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (thirtyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBwGXIdcuvqbqhNJPsIfmh2tP0Shc4trXZzSx3skmF_n26Xo77fA'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 30  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (fiftyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSw3YSzhuSrdbdYqRQWQWQ18dI0w86rO3Yra0-_aS2jtd1hsKRqg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 50  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (sixtyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK2FzKVpNJc-plTVfdEsIoD7RQLIcazKDqTVfU1QQo0qQZMs-TOA'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 60  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (seventyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfUpX1oWtQmedBft7sLvGbLLPBJmYLEmUdwXVQSjzpsX5FRCRp'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 70  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (eightyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl1D44tWaMBRnIB8pLCPTdou1qVtHEqDU_NR30Py739wiU82p-rw'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 80  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (nintyride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 90  Rides in The app",
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
                                                    Stack(
                                                      children: [
                                                        new Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: const Color(
                                                                0xff7c94b6),
                                                            image: (hundredride ==
                                                                    false)
                                                                ? new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : new DecorationImage(
                                                                    image: new NetworkImage(
                                                                        'https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .all(new Radius
                                                                        .circular(
                                                                    50.0)),
                                                            border:
                                                                new Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 4.0,
                                                            ),
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
                                                          "Reaches 100  Rides in The app",
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
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    Stack(
//                                                      children: [
//                                                        new Container(
//                                                          width: 100.0,
//                                                          height: 100.0,
//                                                          decoration:
//                                                              new BoxDecoration(
//                                                            color: const Color(
//                                                                0xff7c94b6),
//                                                            image: (oneride ==
//                                                                    false)
//                                                                ? new DecorationImage(
//                                                                    image: new NetworkImage(
//                                                                        'http://i.imgur.com/QSev0hg.jpg'),
//                                                                    fit: BoxFit
//                                                                        .cover,
//                                                                  )
//                                                                : new DecorationImage(
//                                                                    image: new NetworkImage(
//                                                                        'https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                    fit: BoxFit
//                                                                        .cover,
//                                                                  ),
//                                                            borderRadius:
//                                                                new BorderRadius
//                                                                    .all(new Radius
//                                                                        .circular(
//                                                                    50.0)),
//                                                            border:
//                                                                new Border.all(
//                                                              color:
//                                                                  Colors.white,
//                                                              width: 4.0,
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Reaches First  Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),

//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Reaches 3 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
////         :new Text("a7a"),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Reaches 10 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "20 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "30 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "40 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "50 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "60 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "70 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "80 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "90 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "100 Rides in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "200 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "300 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "400 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "500 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "600 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "700 Ride in The app",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 1 ton of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 3 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 5 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 10 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
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
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 20 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 30 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 40 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 50 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 60 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 70 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 80 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 90 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 100 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.all(16.0),
//                            child: Container(
//                              child: Material(
//                                color: Colors.white,
//                                elevation: 14.0,
//                                borderRadius: BorderRadius.circular(24.0),
//                                shadowColor: Color(0x802196F3),
//                                child: Row(
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: Container(
//                                          child: new Container(
//                                        child: new Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            ListTile(
//                                              subtitle: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 0.0),
//                                                child: Row(
//                                                  children: <Widget>[
//                                                    new Container(
//                                                      width: 100.0,
//                                                      height: 100.0,
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: const Color(
//                                                            0xff7c94b6),
//                                                        image:
//                                                            new DecorationImage(
//                                                          image: new NetworkImage(
//                                                              'http://i.imgur.com/QSev0hg.jpg'),
//                                                          fit: BoxFit.cover,
//                                                        ),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .all(new Radius
//                                                                    .circular(
//                                                                50.0)),
//                                                        border: new Border.all(
//                                                          color: Colors.white,
//                                                          width: 4.0,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                            const EdgeInsets
//                                                                    .only(
//                                                                left: 4.0),
//                                                        child: new Text(
//                                                          "Save 110 tons of CO2",
//                                                          style: new TextStyle(
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                            fontSize: 23.0,
//                                                            color: Colors.black,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      )),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
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

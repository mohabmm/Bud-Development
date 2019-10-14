import 'package:budupdated/ui/views/passenger_achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'driver_achievement.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Heroes"),
                Tab(text: "Buds"),
              ],
            ),
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: Text('LeaderBoard'),
          ),
          body: TabBarView(children: [
            DriverAchievement(),
            PassengerAchievement(),
          ]),
        ),
      ),
    );
  }
}
//
//class _AchievementsState extends State<Achievements>
//    with SingleTickerProviderStateMixin {
//  @override
//  Widget build(BuildContext context) {
//    var user = Provider.of<FirebaseUser>(context);
//
//    return MaterialApp(
//      home: DefaultTabController(
//        length: 2,
//        child: Scaffold(
//          appBar: AppBar(
//            bottom: TabBar(
//              tabs: [
//                Tab(text: "Heroes"),
//                Tab(text: "Buds"),
//              ],
//            ),
//            centerTitle: true,
//            leading: new IconButton(
//              icon: new Icon(
//                Icons.arrow_back,
//              ),
//              onPressed: () => Navigator.of(context).pop(),
//            ),
//            title: Text('Achievements'),
//          ),
//          body: TabBarView(
//            children: [
//// This part is for Heroes
//              StreamBuilder<QuerySnapshot>(
//                  stream: Firestore.instance
//                      .collection('Achievements')
//                      .where("email", isEqualTo: user.email)
//                      .snapshots(),
//                  builder: (BuildContext context,
//                      AsyncSnapshot<QuerySnapshot> snapshot) {
//                    switch (snapshot.connectionState) {
//                      case ConnectionState.waiting:
//                        return new Center(
//                            child: new CircularProgressIndicator());
//                      default:
//                        if (!snapshot.hasData) {
//                          return Center(
//                              child: new Text("No Achievements Reached Yet"));
//                        }
//                        if (snapshot.hasError) {
//                          return new Text('Error: ${snapshot.error}');
//                        } else if (snapshot.hasData) {
//                          switch (snapshot.connectionState) {
//                            case ConnectionState.waiting:
//                              return new Text('Loading...');
//                            default:
//                              print("the lenght is" +
//                                  snapshot.data.documents.length.toString());
//
//                              return Column(
//                                children: <Widget>[
//                                  Expanded(
//                                    child: ListView.builder(
//                                        shrinkWrap: true,
//                                        itemCount:
//                                            snapshot.data.documents.length,
//                                        itemBuilder:
//                                            (BuildContext context, int index) {
//                                          bool onerideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['first ride as driver'];
//
//                                          bool thirdrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['third ride as driver'];
//                                          bool fifthrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['fifth ride as driver'];
//                                          bool tenrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['10 ride as driver'];
//                                          bool twentyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['20 ride as driver'];
//                                          bool thirtyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['30 ride as driver'];
//                                          bool fortyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['40 ride as driver '];
//                                          bool fiftyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['50 ride as driver'];
//                                          bool sixtyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['60 ride as driver'];
//                                          bool seventyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['70 ride as driver'];
//                                          bool eightyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['80 ride as driver'];
//                                          bool nintyrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['90 ride as driver'];
//                                          bool hundredrideasdriver = snapshot
//                                              .data
//                                              .documents[index]
//                                              .data['100 ride as driver'];
//
//                                          return SingleChildScrollView(
//                                            child: Column(
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
////                                                          mainAxisSize:
////                                                              MainAxisSize.min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (onerideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches First  Ride as Driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (thirdrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://4.imimg.com/data4/EH/CI/MY-29481057/winner-trophy-cup-500x500.jpg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches Third  Ride as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (fifthrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://image.shutterstock.com/image-vector/isolated-realictic-soccer-gold-cup-450w-432985924.jpg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches Fifth  Ride as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (tenrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaklRrppkJku3S0PWMqcP6BkZHfj2_lShHHA_N-HXvQPTO90La'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 10  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (twentyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0_j_PQKrnLnjQUFZxn6joRZJuRjPNnsYMcVRuXoYeXQeLrNJC'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 20  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (thirtyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBwGXIdcuvqbqhNJPsIfmh2tP0Shc4trXZzSx3skmF_n26Xo77fA'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 30  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (fortyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 40  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (fiftyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSw3YSzhuSrdbdYqRQWQWQ18dI0w86rO3Yra0-_aS2jtd1hsKRqg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 50  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (sixtyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK2FzKVpNJc-plTVfdEsIoD7RQLIcazKDqTVfU1QQo0qQZMs-TOA'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 60  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (seventyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfUpX1oWtQmedBft7sLvGbLLPBJmYLEmUdwXVQSjzpsX5FRCRp'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 70 as driver  Rides in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (eightyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl1D44tWaMBRnIB8pLCPTdou1qVtHEqDU_NR30Py739wiU82p-rw'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 80  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (nintyrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 90  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(16.0),
//                                                  child: Container(
//                                                    child: Material(
//                                                      color: Colors.white,
//                                                      elevation: 14.0,
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              24.0),
//                                                      shadowColor:
//                                                          Color(0x802196F3),
//                                                      child: Row(
//                                                        children: <Widget>[
//                                                          new Expanded(
//                                                            child: Container(
//                                                                child:
//                                                                    new Container(
//                                                              child: new Column(
//                                                                mainAxisSize:
//                                                                    MainAxisSize
//                                                                        .min,
//                                                                children: <
//                                                                    Widget>[
//                                                                  ListTile(
//                                                                    subtitle:
//                                                                        Padding(
//                                                                      padding: const EdgeInsets
//                                                                              .only(
//                                                                          top:
//                                                                              0.0),
//                                                                      child:
//                                                                          Row(
//                                                                        children: <
//                                                                            Widget>[
//                                                                          Stack(
//                                                                            children: [
//                                                                              new Container(
//                                                                                width: 100.0,
//                                                                                height: 100.0,
//                                                                                decoration: new BoxDecoration(
//                                                                                  color: const Color(0xff7c94b6),
//                                                                                  image: (hundredrideasdriver == false)
//                                                                                      ? new DecorationImage(
//                                                                                          image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        )
//                                                                                      : new DecorationImage(
//                                                                                          image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                          fit: BoxFit.cover,
//                                                                                        ),
//                                                                                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                                                                                  border: new Border.all(
//                                                                                    color: Colors.white,
//                                                                                    width: 4.0,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//                                                                            ],
//                                                                          ),
//                                                                          Expanded(
//                                                                            child:
//                                                                                Padding(
//                                                                              padding: const EdgeInsets.only(left: 4.0),
//                                                                              child: new Text(
//                                                                                "Reaches 100  Rides as driver in The app",
//                                                                                style: new TextStyle(
//                                                                                  fontWeight: FontWeight.bold,
//                                                                                  fontSize: 23.0,
//                                                                                  color: Colors.black,
//                                                                                ),
//                                                                              ),
//                                                                            ),
//                                                                          ),
//                                                                        ],
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                            )),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          );
//                                        }),
//                                  ),
//                                ],
//                              );
//                          }
//                        }
//                    }
//                    return new Container();
//                  }),
//
//              // this part is for buds
//
//              ///
//              StreamBuilder<QuerySnapshot>(
//                  stream: Firestore.instance
//                      .collection('Achievements')
//                      .where("email", isEqualTo: user.email)
//                      .snapshots(),
//                  builder: (BuildContext context,
//                      AsyncSnapshot<QuerySnapshot> snapshot) {
////                    print("the achievement that should shown is " +
////                        onerideasguest.toString());
//                    if (!snapshot.hasData) {
//                      return Center(
//                          child: new Text("No Achievements Reached Yet"));
//                    }
//                    if (snapshot.hasError) {
//                      return new Text('Error: ${snapshot.error}');
//                    } else if (snapshot.hasData) {
//                      switch (snapshot.connectionState) {
//                        case ConnectionState.waiting:
//                          return new Text('Loading...');
//                        default:
//                          print("the lenght is" +
//                              snapshot.data.documents.length.toString());
//
//                          return ListView.builder(
//                              shrinkWrap: true,
//                              itemCount: snapshot.data.documents.length,
//                              itemBuilder: (BuildContext context, int index) {
//                                bool onerideasguest = snapshot
//                                    .data
//                                    .documents[index]
//                                    .data['first ride as guest'];
//                                bool thirdrideasguest = snapshot
//                                    .data
//                                    .documents[index]
//                                    .data['third ride as guest'];
//                                bool fifthrideasguest = snapshot
//                                    .data
//                                    .documents[index]
//                                    .data['fifth ride as guest'];
//                                bool tenrideasguest = snapshot.data
//                                    .documents[index].data['10 ride as guest'];
//                                bool twentyrideasguest = snapshot.data
//                                    .documents[index].data['20 ride as guest'];
//                                bool thirtyrideasguest = snapshot.data
//                                    .documents[index].data['30 ride as guest'];
//                                bool fortyrideasguest = snapshot.data
//                                    .documents[index].data['40 ride as guest'];
//                                bool fiftyrideasguest = snapshot.data
//                                    .documents[index].data['50 ride as guest'];
//                                bool sixtyrideasguest = snapshot.data
//                                    .documents[index].data['60 ride as guest'];
//                                bool seventyrideasguest = snapshot.data
//                                    .documents[index].data['70 ride as guest'];
//                                bool eightyrideasguest = snapshot.data
//                                    .documents[index].data['80 ride as guest'];
//                                bool nintyrideasguest = snapshot.data
//                                    .documents[index].data['90 ride as guest'];
//                                bool hundredrideasguest = snapshot.data
//                                    .documents[index].data['100 ride as guest'];
//
//                                return SingleChildScrollView(
//                                  child: Column(
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (onerideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches First  Ride as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (thirdrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://4.imimg.com/data4/EH/CI/MY-29481057/winner-trophy-cup-500x500.jpg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches Third  Ride as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (fifthrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://image.shutterstock.com/image-vector/isolated-realictic-soccer-gold-cup-450w-432985924.jpg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches Fifth  Ride as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (tenrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaklRrppkJku3S0PWMqcP6BkZHfj2_lShHHA_N-HXvQPTO90La'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 10  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (twentyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0_j_PQKrnLnjQUFZxn6joRZJuRjPNnsYMcVRuXoYeXQeLrNJC'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 20  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (thirtyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBwGXIdcuvqbqhNJPsIfmh2tP0Shc4trXZzSx3skmF_n26Xo77fA'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 30  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (fortyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSw3YSzhuSrdbdYqRQWQWQ18dI0w86rO3Yra0-_aS2jtd1hsKRqg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 40  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (fiftyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSw3YSzhuSrdbdYqRQWQWQ18dI0w86rO3Yra0-_aS2jtd1hsKRqg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 50  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (sixtyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK2FzKVpNJc-plTVfdEsIoD7RQLIcazKDqTVfU1QQo0qQZMs-TOA'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 60  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (seventyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfUpX1oWtQmedBft7sLvGbLLPBJmYLEmUdwXVQSjzpsX5FRCRp'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 70  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (eightyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl1D44tWaMBRnIB8pLCPTdou1qVtHEqDU_NR30Py739wiU82p-rw'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 80  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (nintyrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 90  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: EdgeInsets.all(16.0),
//                                        child: Container(
//                                          child: Material(
//                                            color: Colors.white,
//                                            elevation: 14.0,
//                                            borderRadius:
//                                                BorderRadius.circular(24.0),
//                                            shadowColor: Color(0x802196F3),
//                                            child: Row(
//                                              children: <Widget>[
//                                                new Expanded(
//                                                  child: Container(
//                                                      child: new Container(
//                                                    child: new Column(
//                                                      mainAxisSize:
//                                                          MainAxisSize.min,
//                                                      children: <Widget>[
//                                                        ListTile(
//                                                          subtitle: Padding(
//                                                            padding:
//                                                                const EdgeInsets
//                                                                        .only(
//                                                                    top: 0.0),
//                                                            child: Row(
//                                                              children: <
//                                                                  Widget>[
//                                                                Stack(
//                                                                  children: [
//                                                                    new Container(
//                                                                      width:
//                                                                          100.0,
//                                                                      height:
//                                                                          100.0,
//                                                                      decoration:
//                                                                          new BoxDecoration(
//                                                                        color: const Color(
//                                                                            0xff7c94b6),
//                                                                        image: (hundredrideasguest ==
//                                                                                false)
//                                                                            ? new DecorationImage(
//                                                                                image: new NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/33/cross-157492_960_720.png'),
//                                                                                fit: BoxFit.cover,
//                                                                              )
//                                                                            : new DecorationImage(
//                                                                                image: new NetworkImage('https://image.shutterstock.com/image-vector/golden-trophy-winners-cup-flat-450w-1330855736.jpg'),
//                                                                                fit: BoxFit.cover,
//                                                                              ),
//                                                                        borderRadius: new BorderRadius
//                                                                            .all(new Radius
//                                                                                .circular(
//                                                                            50.0)),
//                                                                        border:
//                                                                            new Border.all(
//                                                                          color:
//                                                                              Colors.white,
//                                                                          width:
//                                                                              4.0,
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ],
//                                                                ),
//                                                                Expanded(
//                                                                  child:
//                                                                      Padding(
//                                                                    padding: const EdgeInsets
//                                                                            .only(
//                                                                        left:
//                                                                            4.0),
//                                                                    child:
//                                                                        new Text(
//                                                                      "Reaches 100  Rides as passenger in The app",
//                                                                      style:
//                                                                          new TextStyle(
//                                                                        fontWeight:
//                                                                            FontWeight.bold,
//                                                                        fontSize:
//                                                                            23.0,
//                                                                        color: Colors
//                                                                            .black,
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  )),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                );
//                              });
//                      }
//                    }
//
//                    return new Container();
//                  }),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

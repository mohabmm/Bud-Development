import 'package:budupdated/views/card_details.dart';
import 'package:budupdated/views/check_driver_status.dart';
import 'package:budupdated/views/detailsContainer.dart';
import 'package:budupdated/views/enter_ride_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  FirebaseUser user;

  Trip({this.user});
  @override
  _State createState() => new _State(firebaseuser: user);
}

class _State extends State<Trip> {
  FirebaseUser firebaseuser;

  _State({this.firebaseuser});

  final color = const Color(0xFF13DDD2);

  bool correct;
  Future checkFirstSeen() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              if (doc["Driver authnticated"] == true) {
                print("the current driver status is " +
                    doc["Driver authnticated"].toString());
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new EnterRideDetails(user: firebaseuser)));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckDriverStatus(firebaseuser)));
              }
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
      if (doc["Driver authnticated"] == true) {
        correct=true;
      } else {
        correct=false;
      }
    }));

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: "btn5",
        backgroundColor: color,
        onPressed: () {











         if(correct){
           Navigator.of(context).pushReplacement(new MaterialPageRoute(
               builder: (BuildContext context) =>
               new EnterRideDetails(user: firebaseuser)));

         }
          else{
           Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => CheckDriverStatus(firebaseuser)));
         }
        //  checkFirstSeen();
        },
        tooltip: 'add new trip',
        child: new Icon(Icons.add),
      ), //

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

    int id =
    snapshot.data.documents[index].data['RideId'];



    String Telephone =
    snapshot.data.documents[index].data['Telephone'].toString();

    String carnumber =
    snapshot.data.documents[index].data['CarNumber'].toString();

    String cartype =
    snapshot.data.documents[index].data['CarType'].toString();

    String carcolor =
    snapshot.data.documents[index].data['CarColor'].toString();

    String NoOfSeats = snapshot
        .data.documents[index].data['No Of Seats']
        .toString();
    String To =
    snapshot.data.documents[index].data['To'].toString();

    bool ridestatus=     snapshot.data.documents[index].data['RideStatus'];

    String Trip_date = snapshot
        .data.documents[index].data['Trip Date']
        .toString();

    String username = snapshot.data.documents[index].data['User name']
        .toString();
    String describtion = snapshot
        .data.documents[index].data['describtion']
        .toString();

    return GestureDetector(
    onTap: () {
    Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) => new CardDetails(
      id,
    firebaseuser,
    username,
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

    )));
    },

    child:  Padding(padding:EdgeInsets.all(16.0),
                  child: Container(


                      child: Material(
                        color: Colors.white,
                        elevation:14.0 ,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: Container(
                                child:          new Container(
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
//           title: Padding(
//
//             padding: const EdgeInsets.only(top: 8.0),
//             child:  Text("2:48 PM",style: TextStyle(fontSize: 22.0),),
//           ),
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
                                          image:
                                          new NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                        new BorderRadius.all(new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 4.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:18.0),
                                        child: new Text(
                                          from,
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
                                            padding: const EdgeInsets.only(bottom:60.0),
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
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: new Text(
                                          //To,
                                          To,
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
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: new Row(
                                // make buttons use the appropriate styles for cards
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[


                                  Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 6.0,left: 30.0),

                                    child: new Text(
                                      username,
                                      style: new TextStyle(
                                        fontSize: 18.0,
//                           fontWeight: FontWeight.w600,
                                      ),
                                    ),


                                  ),

                                  Padding(

                                    padding: const EdgeInsets.only(bottom: 8.0,right: 28.0),
                                    child:  Text(Trip_date,style: TextStyle(fontSize: 18.0),),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),




                      )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



            );
          }
            );
          }
          else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

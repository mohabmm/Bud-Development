import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:url_launcher/url_launcher.dart' as lan;

//TODO


class CardDetails extends StatefulWidget {
  String username;
  FirebaseUser firebaseuser;
  String describtion;
  String from;
  String to;
  String trip_date;
  String noOfSeats;
  String carcolor;
  String carnumber;
  String cartype;
  CardDetails(
    this.firebaseuser,
    this.username,
    this.describtion,
    this.from,
    this.to,
    this.trip_date,
    this.noOfSeats,
    this.cartype,
    this.carnumber,
    this.carcolor,
  );

  @override
  _CardDetailsState createState() => _CardDetailsState(
      firebaseuser,
      username,
      describtion,
      from,
      to,
      trip_date,
      noOfSeats,
      cartype,
      carnumber,
      carcolor);
}

class _CardDetailsState extends State<CardDetails> {
  double rate = 0;
  int number_of_rides;
  FirebaseUser datauser;
  String user;
  String describtion;
  String from;
  String to;
  String trip_date;
  String noOfSeats;
  String cartype;
  String carnumber;
  String carcolor;

  _CardDetailsState(
      this.datauser,
      this.user,
      this.describtion,
      this.from,
      this.to,
      this.trip_date,
      this.noOfSeats,
      this.cartype,
      this.carnumber,
      this.carcolor);


  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: datauser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              number_of_rides = doc.data['Number Of Rides'];
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          elevation: 0.0,
        ),
        body: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      width: double.infinity,
                      color: Colors.cyan,
                    ),
                    new Container(
                      height: 50.0,
                      width: double.infinity,
                    )
                  ],
                ),
                new Center(
                  child: new Container(
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
                )
              ],
            ),
            (user != null)
                ? new Text(
                    user,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 22.0),
                  )
                : "sfsf",
            new StarRating(
              rating: rate,
              starCount: 5,
              size: 20,
              onRatingChanged: (r) {
                setState(() {
                  rate = r;
                });
              },
            ),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Container(
              margin: const EdgeInsets.only(left: 14.0, right: 16.0),
              child: new Text(describtion),
            ),
            new Container(
              padding: const EdgeInsets.only(left: 14.0, top: 20.0),
              alignment: Alignment.topLeft,
              child: new Text(
                "Ride details",
                style: new TextStyle(fontWeight: FontWeight.w600),
              ),
              //child: new Text("ride details"),
            ),
            new Container(
              padding: const EdgeInsets.all(14.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    from,
                    style: new TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17.0),
                  ),
                  Spacer(),
                  new Text(
                    trip_date,
                    style: new TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.0),
                  )
                ],
              ),
            ),
            new Container(
                padding: const EdgeInsets.all(14.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      to,
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17.0),
                    ),
                    Spacer(),
                    new Text(
                      noOfSeats,
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                  ],
                )),
            new Divider(color: Colors.black87),
            new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 17.5),
                  child: new Text(
                    "Car details",
                    style: new TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 14.0),
                    ),
                    new Text(cartype),
                    new Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      width: 1.0,
                      height: 27.0,
                      color: Colors.black87,
                    ),
                    new Text(carcolor),
                    new Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      width: 1.0,
                      height: 27.0,
                      color: Colors.black87,
                    ),
                    new Text(carnumber),
                  ],
                ),
                new Divider(
                  color: Colors.black87,
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(left: 17.5),
                      child: new Text(
                        "Preferences",
                        style: new TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    new Container(
                        margin: const EdgeInsets.only(left: 85.0, right: 85.0),
                        child: new Icon(Icons.music_note)),
                    new Icon(Icons.smoking_rooms)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 11.0, 0.0, 8.0),
                            margin:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: new Text(
                              "RESERVE A SEAT",
                              style: new TextStyle(fontWeight: FontWeight.w600),
                            )),
                        new Container(
                            child: new FloatingActionButton(
                          onPressed: () =>
                              showTapMsg(context, number_of_rides, datauser),
                          backgroundColor: Colors.cyan,
                          child: Icon(
                            Icons.add,
                            size: 40.0,
                          ),
                        ))
                      ],
                    ),
                    new Column(children: <Widget>[
                      new Container(
                          padding:
                              const EdgeInsets.fromLTRB(100.0, 10.0, 0.0, 10.0),
                          child: new Text(
                            "CALL THE DRIVER",
                            style: new TextStyle(fontWeight: FontWeight.w600),
                          )),
                      new StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('users')
                              .where("email", isEqualTo: datauser.email)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              String telephone = snapshot
                                  .data.documents[0].data['Phone Number'];

                              return new Container(
                                margin: const EdgeInsets.fromLTRB(
                                    100.0, 0.0, 0.0, 0.0),
                                child: new FloatingActionButton(
                                  heroTag: "btn1",
                                  onPressed: () =>
                                      lan.launch("tel://" + telephone),
                                  backgroundColor: Colors.cyan,
                                  child: Icon(
                                    Icons.call,
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }
                            else{
                              return new Text("wait there is an error");
                            }
                          }),
                    ])
                  ],
                )
              ],
            )
          ],
        ));
  }
}

void showTapMsg(BuildContext context, int number_of_rides, FirebaseUser datauser) {
  number_of_rides += 1;

  var alert = new AlertDialog(
    title: new Text(
        "Congratulation You have reserved a seat,you can press on the telephone icon to call the driver and discuss the details. "),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          print("fine");
        },
        child: new Text(
          "OK",
          style: TextStyle(color: Colors.cyan, fontSize: 17.5),
        ),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });

  Firestore.instance.collection('users').document(datauser.email).updateData({
    "Number Of Rides": number_of_rides,

  });


  if(number_of_rides==1|| number_of_rides==3|| number_of_rides==5|| number_of_rides==10|| number_of_rides==20|| number_of_rides==3|| number_of_rides==30|| number_of_rides==3|| number_of_rides==40|| number_of_rides==50){

    print("congurtlation new achievement is reached");
  }
}
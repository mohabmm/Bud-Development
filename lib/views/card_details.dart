import 'package:budupdated/views/map_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart' as lan;

//TODO






class CardDetails extends StatefulWidget {
  int id;
  String username;
  FirebaseUser firebaseuser;
  String describtion;
  String from;
  String to;
  String trip_date;
  String noOfSeats;
  String carnumber;
  String cartype;
  String carcolor;
  String telephone;

  CardDetails(
  this.id,
      this.firebaseuser,
      this.username,
    this.describtion,
    this.from,
    this.to,
    this.trip_date,
    this.noOfSeats,
      this.carnumber,
      this.cartype,
    this.carcolor,
      this. telephone,
  );

  @override
  _CardDetailsState createState() => _CardDetailsState(
    id,
      firebaseuser,
      username,
      describtion,
      from,
      to,
      trip_date,
      noOfSeats,
    carnumber,
      cartype,
    carcolor,
      telephone,
      );
}



class _CardDetailsState extends State<CardDetails> {
  int id;
  final GlobalKey<ScaffoldState> _scaffoldstate =
  new GlobalKey<ScaffoldState>();
  String start;
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
  String telephone;
  bool isrideowner;
  bool ridecond;

  Future checkFirstSeens() async {

     someMethod();

  }


  Future getLocation() async {

    var geoLocator = Geolocator();
    var status = await geoLocator.checkGeolocationPermissionStatus();

    if (status == GeolocationStatus.denied){
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enable your GPS as access to it is denied")));
      });
    }
    // Take user to permission settings

    // Take user to location page
    else if (status == GeolocationStatus.restricted){
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enable your GPS ")));
      });
    }
    // Restricted
    else if (status == GeolocationStatus.unknown){
      setState(() {
        _scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enable your GPS in order to start the ride")));
      });
    }
    // Unknown
    else if (status == GeolocationStatus.granted) {
      // Permission granted and location enabled
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("the start longitude from the first screen is " +
          position.longitude.toString());
      Future.delayed(new Duration(milliseconds: 30)

        //  ;


      );
//    setState(() {
//     // start=position.toString();
//     // print("my current start postion is "+start.toString());
//
//    });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapsNavigation(position),
        ),

      );
    }
  }
  someMethod() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print("the current user is "+user.email);
    Firestore.instance
        .collection('Offer Ride list')
       .where("RideId", isEqualTo: id)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
      if (user.email == doc["Ride Owner"]) {
        print("the doc Rideowner is"+doc["Ride Owner"].toString());
        setState(() {
          isrideowner = true;
          print("iam the ride owner");
        });

      }
      else {
        setState(() {
          isrideowner=false;
          print("iam not  the ride owner");


        });
      }
    }));
    return user;
  }
    _CardDetailsState(
        this. id,
      this.datauser,
      this.user,
      this.describtion,
      this.from,
      this.to,
      this.trip_date,
      this.noOfSeats,
      this.cartype,
      this.carnumber,
      this.carcolor,
  this.telephone,
       );


  @override
  void initState() {
    super.initState();
    print("the data user is "+datauser.toString());
    print("the user is "+user.toString());
    print("the describtion is "+describtion);
    print("from is"+from);
    print("to is "+to);
    print("trip date is "+trip_date);
    print("number of seta is "+noOfSeats);

    print("car type is"+cartype);
    print("car number is "+carnumber);
    print("car color is "+carcolor);

    print("telephone is "+telephone);
    checkFirstSeens();
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
        key: _scaffoldstate,

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
                (isrideowner == false)? new Row(
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
                              showTapMsg(context, number_of_rides, datauser,_scaffoldstate),
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

                               new Container(
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
                              ),

                    ])
                  ],
                ):new Container(),
                (isrideowner==true)?Padding(
                  padding: const EdgeInsets.only(right:66.0),
                  child: Center(
                    child: RaisedButton(
                      child: Text('Start The Ride'),
//                      onPressed: () => Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => MapsNavigation(start),
//                        ),
//                      ),
                      color: Colors.green, onPressed:getLocation, //specify background color  of button from our list of colors
                    ),
                  ),
                ):new Container(),

              ],
            )
          ],
        ));
  }
}

void showTapMsg(BuildContext context, int number_of_rides, FirebaseUser datauser, GlobalKey<ScaffoldState> scaffoldstate) {
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


  if(number_of_rides==1|| number_of_rides==3|| number_of_rides==5|| number_of_rides==10|| number_of_rides==20||  number_of_rides==30|| number_of_rides==40|| number_of_rides==50){



    scaffoldstate.currentState
        .showSnackBar(new SnackBar(content: new Text("Congurtlation new Achievement is reached having "+number_of_rides.toString()+" rides in our app")));

    print("congurtlation new achievement is reached");
if(number_of_rides==1){

  Firestore.instance.collection('Achievements').document(datauser.email).updateData({
    "first ride": true,

  });
}
if(number_of_rides==3){

  Firestore.instance.collection('Achievements').document(datauser.email).updateData({
    "third ride": true,

  });
}

    if(number_of_rides==5){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "fifth ride": true,

      });
    }
    if(number_of_rides==10){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "10 ride": true,

      });
    }
    if(number_of_rides==20){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "20 ride": true,

      });
    }
    if(number_of_rides==30){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "30 ride": true,

      });
    }
    if(number_of_rides==40){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "40 ride": true,

      });
    }
    if(number_of_rides==50){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "50 ride": true,

      });
    }
    if(number_of_rides==60){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "60 ride": true,

      });
    }if(number_of_rides==70){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "70 ride": true,

      });
    }if(number_of_rides==80){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "80 ride": true,

      });
    }if(number_of_rides==90){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "90 ride": true,

      });
    }
    if(number_of_rides==100){

      Firestore.instance.collection('Achievements').document(datauser.email).updateData({
        "100 ride": true,

      });
    }




  }
}


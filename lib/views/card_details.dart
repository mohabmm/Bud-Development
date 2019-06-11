import 'package:budupdated/views/map_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart' as lan;

class CardDetails extends StatefulWidget {
  int id;
  String rideownerusername;
  FirebaseUser loggedinuser;
  String describtion;
  String from;
  String to;
  String trip_date;
  int noOfSeats;
  String carnumber;
  String cartype;
  String carcolor;
  String telephone;
  bool ridestatus;
  bool ridefinished;
  String rideowneremail;
  String photourl;
  CardDetails(
    this.id,
    this.loggedinuser,
    this.rideownerusername,
    this.describtion,
    this.from,
    this.to,
    this.trip_date,
    this.noOfSeats,
    this.carnumber,
    this.cartype,
    this.carcolor,
    this.telephone,
    this.ridestatus,
    this.ridefinished,
    this.rideowneremail,
    this.photourl,
  );

  @override
  _CardDetailsState createState() => _CardDetailsState(
        id,
        // current logged in user
        loggedinuser,
        rideownerusername,
        describtion,
        from,
        to,
        trip_date,
        noOfSeats,
        carnumber,
        cartype,
        carcolor,
        telephone,
        ridestatus,
        ridefinished,
        rideowneremail,
        photourl,
      );
}

class _CardDetailsState extends State<CardDetails> {
  String driverrate;
  int id;
  final GlobalKey<ScaffoldState> scaffoldstate = new GlobalKey<ScaffoldState>();
  String start;
  double rate = 0.0;
  int number_of_ridesasDriver;
  int number_of_ridesasguest;

  FirebaseUser loggedinuser;
  String rideownerusername;
  String describtion;
  String from;
  String to;
  String trip_date;
  int noOfSeats;
  String cartype;
  String carnumber;
  String carcolor;
  String telephone;
  bool isrideowner;
  bool ridecond;
  bool ridestatus;
  String rideguestemail;
  bool ridefinished;
  int rideid;
  var rating = 0.0;
  String rideowner;
  String potentialrideguest;
  String photourl;

  Future checktherideowner() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print("the current user is " + user.email);
    Firestore.instance
        .collection('Offer Ride list')
        .where("RideId", isEqualTo: id)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              // here we compare between the current user email with doc ride owner whitch is uploaded
              //to be equal to the ride owner email
              if (user.email == doc["Ride Owner"]) {
                print("the doc Rideowner is" + doc["Ride Owner"].toString());
                setState(() {
                  isrideowner = true;
                  print("iam the ride owner");
                });
              } else {
                print("the doc Rideowner email is" +
                    doc["Ride Owner"].toString());

                setState(() {
                  isrideowner = false;
                  print("iam not  the ride owner");
//                  rideguestemail = user.email;
                  potentialrideguest = user.email;
                  print("the potential ride guest is" + potentialrideguest);
                  getnumberofridesasguest();

                  //Firestore.instance.collection(path)
                });
              }
            }));
    return user;
  }

  Future getLocation() async {
    var geoLocator = Geolocator();
    var status = await geoLocator.checkGeolocationPermissionStatus();

    if (status == GeolocationStatus.denied) {
      setState(() {
        scaffoldstate.currentState.showSnackBar(new SnackBar(
            content:
                new Text("please enable your GPS as access to it is denied")));
      });
    } else if (status == GeolocationStatus.restricted) {
      setState(() {
        scaffoldstate.currentState.showSnackBar(
            new SnackBar(content: new Text("please enable your GPS ")));
      });
    }
    // Restricted
    else if (status == GeolocationStatus.unknown) {
      setState(() {
        scaffoldstate.currentState.showSnackBar(new SnackBar(
            content:
                new Text("please enable your GPS in order to start the ride")));
      });
    }
    // Unknown
    else if (status == GeolocationStatus.granted) {
      // Permission granted and location enabled
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("the start longitude from the first screen is " +
          position.longitude.toString());
      Future.delayed(new Duration(milliseconds: 30));

      if (rideguestemail == " " ||
          rideguestemail == null ||
          rideguestemail.isEmpty) {
        scaffoldstate.currentState.showSnackBar(new SnackBar(
            content: new Text(
                "You cant start the  ride unless someone joined your ride")));
        print("you cant start ride unless you have people to go with");
      } else {
        print("the current ride guest status is " + rideguestemail);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapsNavigation(
                position, loggedinuser, rideguestemail, ridefinished, id),
          ),
        );
      }
    }
  }

//  checkingfunction() async {}

  _CardDetailsState(
    this.id,
    this.loggedinuser,
    this.rideownerusername,
    this.describtion,
    this.from,
    this.to,
    this.trip_date,
    this.noOfSeats,
    this.cartype,
    this.carnumber,
    this.carcolor,
    this.telephone,
    this.ridestatus,
    this.ridefinished,
    this.rideowner,
    this.photourl,
  );

  getthedriverrate() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideowner)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              driverrate = doc.data['driverrate'];
            }));

    print("the driver rate is " + driverrate.toString());
  }

  @override
  void initState() {
    super.initState();
    checktherideowner();
    print(
        "the logged in   user  inside initstate is " + loggedinuser.toString());
    print("the ride owner  user name is " + rideownerusername.toString());
    print("the describtion is " + describtion);
    print("from is" + from);
    print("to is " + to);
    print("trip date is " + trip_date);
    print("number of seta is " + noOfSeats.toString());
    print("car type is" + cartype);
    print("car number is " + carnumber);
    print("car color is " + carcolor);
    getthedriverrate();
    print("telephone is " + telephone);

//    (rideguestemail != null) ? getnumberofridesasguesttostartride() : print("moha");
    getnumberofridesasdriver();
    Firestore.instance
        .collection('Offer Ride list')
        .where("RideId", isEqualTo: id)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              ridestatus = doc.data['RideStatus'];
            }));

    // used to read the ride guest
    Firestore.instance
        .collection('Offer Ride list')
        .where("RideId", isEqualTo: id)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              rideguestemail = doc.data['GusestUser'];
            }));
    (rideguestemail != null)
        ? print("the current ride guest of this ride is " + rideguestemail)
        : print("the ride guest is still null");
  }

// used to read the number of rides as driver of the current user in the database
  Future getnumberofridesasdriver() async {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: loggedinuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              number_of_ridesasDriver = doc.data['Number Of Rides As Driver'];
            }));
  }

  // in this part we read number of rides of the user as guest
//  TODO: error here
  getnumberofridesasguest() {
    print(
        "the potential ride guest inside get the number of rides as guest funtion is" +
            potentialrideguest);
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: potentialrideguest)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              setState(() {
                number_of_ridesasguest = doc.data['Number Of Rides As guest'];
                print("the number of rides as guest is " +
                    number_of_ridesasguest.toString());
              });
            }));
    return number_of_ridesasguest;
  }

  getnumberofridesasguesttostartride() {
    print(
        "the potential ride guest inside get the number of rides as guest funtion is" +
            potentialrideguest);
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideguestemail)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              setState(() {
                number_of_ridesasguest = doc.data['Number Of Rides As guest'];
                print("the number of rides as guest is " +
                    number_of_ridesasguest.toString());
              });
            }));
    return number_of_ridesasguest;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldstate,
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
                        image: new NetworkImage(photourl),
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
            (rideownerusername != null)
                ? new Text(
                    rideownerusername,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 22.0),
                  )
                : "sfsf",

            // here we check for the ridefinised is pressed by the driver and the user is not
            // the ride owner so he can give rate for the driver
            (ridefinished == true && isrideowner == false)
                ? SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                      rating = v;
                      String actualrate = rating.toString();

                      setState(() {
                        print("the given rate is " + rating.toString());

                        actualrate = ((rating + double.parse(driverrate)) /
                                number_of_ridesasDriver)
                            .toString();
                        print("the rate after update is " +
                            actualrate.toString());

                        // here the update to the driver rate sshould be finished by the driver
                        Firestore.instance
                            .collection('users')
                            .document(rideowner)
                            .updateData({
                          "driverrate": actualrate,
                        });
                      });
                    },
                    starCount: 5,
                    rating: rating,
                    size: 40.0,
                    color: Colors.green,
                    borderColor: Colors.green,
                  )
                : new Container(),
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
                      noOfSeats.toString(),
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
                (isrideowner == false)
                    ? new Row(
                        children: <Widget>[
                          new Column(children: <Widget>[
                            new Container(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 11.0, 0.0, 8.0),
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: (ridestatus == false)
                                    ? new Text(
                                        "RESERVE A SEAT",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    : new Container()),
                            //ridestatus used to check if the button of reserve a seat is pressed before or not
                            (ridestatus == false)
                                ? new Container(
                                    child: new FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        getnumberofridesasguest();

                                        print(
                                            "the current number of rides as guest is " +
                                                number_of_ridesasguest
                                                    .toString());
                                        Firestore.instance
                                            .collection('Offer Ride list')
                                            .document(id.toString())
                                            .updateData({
                                          "RideStatus": true,
                                        });

                                        rideguestemail = loggedinuser.email;
                                        print("the current ride guest is " +
                                            rideguestemail.toString());
                                        Firestore.instance
                                            .collection('Offer Ride list')
                                            .document(id.toString())
                                            .updateData({
                                          "GusestUser": loggedinuser.email,
                                        });

                                        Firestore.instance
                                            .collection('users')
                                            .document(potentialrideguest)
                                            .updateData({
                                          "Number Of Rides As guest":
                                              number_of_ridesasguest + 1,
                                        });
                                        print(
                                            "the number of ride guest after update is " +
                                                (number_of_ridesasguest + 1)
                                                    .toString());

                                        if (number_of_ridesasguest + 1 == 1 ||
                                            number_of_ridesasguest + 1 == 3 ||
                                            number_of_ridesasguest + 1 == 5 ||
                                            number_of_ridesasguest + 1 == 10 ||
                                            number_of_ridesasguest + 1 == 20 ||
                                            number_of_ridesasguest + 1 == 30 ||
                                            number_of_ridesasguest + 1 == 40 ||
                                            number_of_ridesasguest + 1 == 50) {
                                          scaffoldstate.currentState
                                              .showSnackBar(new SnackBar(
                                                  content: new Text(
                                                      "Congurtlation new Achievement is reached having " +
                                                          (number_of_ridesasguest +
                                                                  1)
                                                              .toString() +
                                                          " rides in our app")));

                                          print(
                                              "congurtlation new achievement is reached");
                                          if (number_of_ridesasguest + 1 == 1) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "first ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 == 3) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "third ride as guest": true,
                                            });
                                          }

                                          if (number_of_ridesasguest + 1 == 5) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "fifth ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              10) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "10 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              20) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "20 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              30) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "30 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              40) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "40 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              50) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "50 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              60) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "60 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              70) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "70 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              80) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "80 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              90) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "90 ride as guest": true,
                                            });
                                          }
                                          if (number_of_ridesasguest + 1 ==
                                              100) {
                                            Firestore.instance
                                                .collection('Achievements')
                                                .document(potentialrideguest)
                                                .updateData({
                                              "100 ride as guest": true,
                                            });
                                          }
                                        }
                                      });
                                    },
//                                    onPressed: () => setState(() {
//                                          showTapMsg(
//                                              context,
//                                              number_of_ridesasguest,
//                                              rideowneruser,
//                                              _scaffoldstate,
//                                              id,
//                                              rideguest);
//                                        }),
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add,
                                      size: 40.0,
                                    ),
                                  ))
                                : new Container(),
                          ]),
                          new Column(children: <Widget>[
                            (ridefinished == false)
                                ? new Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        100.0, 10.0, 0.0, 10.0),
                                    child: new Text(
                                      "CALL THE DRIVER",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ))
                                : new Container(),
                            (ridefinished == false)
                                ? new Container(
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
                                  )
                                : new Container(),
                          ])
                        ],
                      )
                    : new Container(),

                // here we check if the rideowner variable is true then we show the start ride button
                (isrideowner == true)
                    ? Padding(
                        padding: const EdgeInsets.only(right: 66.0),
                        child: Center(
                          child: RaisedButton(
                            child: Text('Start The Ride'),
//                      onPressed: () => Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => MapsNavigation(start),
//                        ),
//                      ),
                            color: Colors.green,
                            onPressed:
                                getLocation, //specify background color  of button from our list of colors
                          ),
                        ),
                      )
                    : new Container(),
              ],
            )
          ],
        ));
  }
}

void showTapMsg(
    BuildContext context,
    int number_of_ridesasguest,
    FirebaseUser datauser,
    GlobalKey<ScaffoldState> scaffoldstate,
    int id,
    String rideguest) {
// in this part we updated number of rides of the user as guest to show achievement of the ride guest

//  number_of_ridesasguest += 1;

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
}

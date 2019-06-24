import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MapsNavigation extends StatefulWidget {
  String start;
  Position position;
  String rideguest;
  bool ridefinished;
  int rideid;

  FirebaseUser firebaseuser;

  MapsNavigation(this.position, this.firebaseuser, this.rideguest,
      this.ridefinished, this.rideid);

  @override
  _MapsNavigationState createState() =>
      _MapsNavigationState(position, firebaseuser, rideguest, rideid);
}

class _MapsNavigationState extends State<MapsNavigation> {
  int olddistnaceofthedriver;
  int olddistnaceofthepassenger;
  bool star;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  bool status = false;
  double distanceInMeters;
  double rideprice;
  String driverrate;
  String passengerrate;
  var rating = 0.0;
  double distnacecoveredinkilo;
  Position startposition;
  FirebaseUser firebaseuser;
  String rideguest;
  int Number_Of_Rides_As_Driver;
  int Number_Of_Rides_As_guest;
  int rideid;
  double originalprice;

  _MapsNavigationState(
      this.startposition, this.firebaseuser, this.rideguest, this.rideid);

  double overalldistanceDriver;
  double overalldistancePassenger;

  String oldco2driver;
  String oldco2passenger;

  String totalco2driver;
  String totalco2Passenger;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future getLocation() async {
    Firestore.instance
        .collection('Offer Ride list')
        .document(rideid.toString())
        .updateData({
      "RideFinished": true,
    });
    Position positionend = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      star = true;
    });
    // cairo ,alex
    distanceInMeters = await Geolocator()
        .distanceBetween(30.033333, 31.233334, 31.205753, 29.924526);
    distnacecoveredinkilo = distanceInMeters.round() / 1000;

    overalldistanceDriver = distnacecoveredinkilo + olddistnaceofthedriver;
    overalldistancePassenger =
        distnacecoveredinkilo + olddistnaceofthepassenger;

    //here we calcuated the perecentage of co2 as driver and we upload it into database

    oldco2driver =
        ((overalldistanceDriver * 130.0) / 1000.0).toStringAsFixed(3);
    oldco2passenger =
        ((overalldistancePassenger * 130.0) / 1000.0).toStringAsFixed(3);

    //update the carpon dioxsie by the driver
    Firestore.instance
        .collection('users')
        .document(firebaseuser.email)
        .updateData({
      "CO2driver": oldco2driver,
    });

    //update the carpon dioxsie of the passenger
    Firestore.instance.collection('users').document(rideguest).updateData({
      "CO2passenger": oldco2passenger,
    });

    originalprice = distnacecoveredinkilo * 1.0.round();

    if (Number_Of_Rides_As_guest >= 20 && Number_Of_Rides_As_guest < 40) {
      // here we decreased the ride price when the user has number of rides equal to 20
      rideprice = distnacecoveredinkilo * 1.0.round() - 2;
    } else if (Number_Of_Rides_As_guest >= 40 &&
        Number_Of_Rides_As_guest < 80) {
      rideprice = distnacecoveredinkilo * 1.0.round() - 4;
    } else if (Number_Of_Rides_As_guest >= 80 &&
        Number_Of_Rides_As_guest < 150) {
      rideprice = distnacecoveredinkilo * 1.0.round() - 5;
    } else {
      rideprice = distnacecoveredinkilo * 1.0.round();
    }

    // this is the rate the driver give to the passenger when he ends the ride

// here we updated the distance travelled by the driver
    Firestore.instance
        .collection('users')
        .document(firebaseuser.email)
        .updateData({
      "distance covered as driver": overalldistanceDriver.round(),
    });

    //  we  UPDATEed the distance travelled by the ride guest (passenger)
    Firestore.instance.collection('users').document(rideguest).updateData({
      "distance covered as passenger": overalldistancePassenger.round(),
    });
    setState(() {
      status = true;

      print("the old distance of the driver is " +
          olddistnaceofthedriver.toString());
      print("the old distance of the passenger is " +
          olddistnaceofthepassenger.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    gettheoldistanceofthedriver();
    gettheoldistanceofthePassenger();
    getnumberofridesasguets();
    getnumberofridesasdriver();
    getthedriverrate();
    getthepassengerrate();
    getc02passenger();
    getco2driver();
    star = false;
    bool status = false;
    print("the ride guest  email is " + rideguest);
  }

  gettheoldistanceofthedriver() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              olddistnaceofthedriver = (doc["distance covered as driver"]);
            }));
  }

  getthedriverrate() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              driverrate = (doc["driverrate"]);
            }));
  }

  getthepassengerrate() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideguest)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              passengerrate = (doc["passengerrate"]);
            }));
  }

  getc02passenger() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideguest)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              oldco2passenger = (doc["CO2passenger"]);
            }));
  }

  getco2driver() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              oldco2driver = (doc["CO2driver"]);
            }));
  }

  getnumberofridesasguets() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideguest)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              Number_Of_Rides_As_guest = (doc["Number Of Rides As guest"]);
            }));
  }

  getnumberofridesasdriver() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              Number_Of_Rides_As_Driver = (doc["Number Of Rides As Driver"]);
            }));
  }

  gettheoldistanceofthePassenger() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: rideguest)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              olddistnaceofthepassenger =
                  (doc["distance covered as passenger"]);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
//
//         body: GoogleMap(
//       mapType: MapType.normal,
//       initialCameraPosition: _kGooglePlex,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     ),
//    floatingActionButton: FloatingActionButton.extended(
//    onPressed: _goToTheLake,
//    label: Text('To the lake!'),
//    icon: Icon(Icons.directions_boat),
//    ),
//    );
//  }
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300.0,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: RaisedButton(
                    child: Text('End The Ride'),
                    onPressed: getLocation,
                    color: Colors
                        .green, //specify background color  of button from our list of colors
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    (status == true)
                        ? new Text("The Distance is " +
                            " " +
                            distnacecoveredinkilo.toString() +
                            " " +
                            "KM")
                        : new Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: (status == true)
                          ? new Text("The Price after discount  is " +
                              rideprice.toString() +
                              " " +
                              "LE")
                          : new Container(),
                    ),
                  ],
                ),
              ),
              (star == true)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new Text("The ride original price is " +
                          originalprice.toString()),
                    )
                  : new Container(),
              (star == true)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new Text(
                          "Please rate the passenger who had the ride with you"),
                    )
                  : new Container(),
              (star == true)
                  ? SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        rating = v;
                        String actualrate = rating.toString();

                        setState(() {
                          status = true;
                          print("the given rate is " + rating.toString());

                          actualrate = ((rating + double.parse(passengerrate)) /
                                  Number_Of_Rides_As_guest)
                              .toStringAsFixed(3);
                          print("the rate after update is " +
                              actualrate.toString());

                          // here the update to the passenger rate sshould be finished by the driver
                          Firestore.instance
                              .collection('users')
                              .document(rideguest)
                              .updateData({
                            "passengerrate": actualrate,
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
            ],
          ),
        ),
      ),
    );
  }
}

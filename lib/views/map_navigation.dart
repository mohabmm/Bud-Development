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
  bool star;
  int olddistnaceofthepassenger;
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

  _MapsNavigationState(
      this.startposition, this.firebaseuser, this.rideguest, this.rideid);

  double overalldistanceDriver;
  double overalldistancePassenger;

  String co2driver;
  String co2passenger;

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
    distanceInMeters = await Geolocator()
        .distanceBetween(31.1143, 30.94012, 29.30995, 30.8418);
    distnacecoveredinkilo = distanceInMeters.round() / 1000;

    overalldistanceDriver = distnacecoveredinkilo + olddistnaceofthedriver;
    overalldistancePassenger =
        distnacecoveredinkilo + olddistnaceofthepassenger;

    //here we calcuated the perecentage of co2 as driver and we upload it into database

    co2driver = ((overalldistanceDriver * 130.0) / 1000.0).toString();
    co2passenger = ((olddistnaceofthepassenger * 130.0) / 1000.0).toString();

    //update the carpon dioxsie by the driver
    Firestore.instance
        .collection('users')
        .document(firebaseuser.email)
        .updateData({
      "CO2driver": co2driver,
    });

    //update the carpon dioxsie by the passenger
    Firestore.instance.collection('users').document(rideguest).updateData({
      "CO2passenger": co2passenger,
    });

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
      "distance covered": overalldistanceDriver.round(),
    });

    //  we  UPDATEed the distance travelled by the ride guest (passenger)
    Firestore.instance.collection('users').document(rideguest).updateData({
      "distance covered": overalldistancePassenger.round(),
    });
    setState(() {
      status = true;

      print("the old distance of the driver is " +
          olddistnaceofthedriver.toString());
      print("the old distance of the passenger is " +
          olddistnaceofthepassenger.toString());
    });

// here we check number of rides as driver to show the user acheievemnt for number of rides as driver
    if (Number_Of_Rides_As_Driver == 1) {
      // show achievements for the user as driver
    }

//here we check for co2 saved for showing achievements
    // we will start with the driver

    // then the same for the passenger
    if (olddistnaceofthedriver == 1000 ||
        olddistnaceofthedriver == 3000 ||
        olddistnaceofthedriver == 5000 ||
        olddistnaceofthedriver == 10000 ||
        olddistnaceofthedriver == 20000 ||
        olddistnaceofthedriver == 30 ||
        olddistnaceofthedriver == 40000 ||
        olddistnaceofthedriver == 50000) {
      _scaffoldstate.currentState.showSnackBar(new SnackBar(
          content: new Text(
              "Congurtlation new Achievement is reached you have saved   " +
                  olddistnaceofthedriver.toString() +
                  "KM" +
                  " of C02 to the environment")));

      print("congurtlation new achievement is reached");
      if (olddistnaceofthedriver == 500) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "0.5 ton": true,
        });
      }
      if (olddistnaceofthedriver == 1000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "1 ton": true,
        });
      }
      if (olddistnaceofthedriver == 3000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "3 ton": true,
        });
      }

      if (olddistnaceofthedriver == 5000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "5 ton": true,
        });
      }
      if (olddistnaceofthedriver == 10000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "10 ton": true,
        });
      }
      if (olddistnaceofthedriver == 11000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "11 ton": true,
        });
      }
      if (olddistnaceofthedriver == 12000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "30 ride": true,
        });
      }
      if (olddistnaceofthedriver == 40000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "12 ton": true,
        });
      }
      if (olddistnaceofthedriver == 13000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "13 ton": true,
        });
      }
      if (olddistnaceofthedriver == 14000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "14 ton": true,
        });
      }
      if (olddistnaceofthedriver == 15000) {
        Firestore.instance
            .collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "15 ton": true,
        });
      }

      print("the actual distance is " + distnacecoveredinkilo.toString());
    }

/////////////////////////////////////////////this part needs to be updated over all saving of environment///

    //  n7sb his total distance we awrelo hwa 3ml save ll environment ad eh until now

    if (olddistnaceofthepassenger == 1000 ||
        olddistnaceofthepassenger == 3000 ||
        olddistnaceofthepassenger == 5000 ||
        olddistnaceofthepassenger == 10000 ||
        olddistnaceofthepassenger == 20000 ||
        olddistnaceofthepassenger == 30 ||
        olddistnaceofthepassenger == 40000 ||
        olddistnaceofthepassenger == 50000) {
//      _scaffoldstate.currentState
//          .showSnackBar(new SnackBar(content: new Text(
//          "Congurtlation new Achievement is reached you have saved   " +
//              olddistnaceofthepassenger.toString() + "KM" +
//              " of C02 to the environment")));

      print("congurtlation new achievement is reached");
      if (olddistnaceofthepassenger == 500) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "0.5 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 1000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "1 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 3000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "3 ton": true,
        });
      }

      if (olddistnaceofthepassenger == 5000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "5 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 10000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "10 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 11000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "11 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 12000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "30 ride": true,
        });
      }
      if (olddistnaceofthepassenger == 40000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "12 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 13000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "13 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 14000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "14 ton": true,
        });
      }
      if (olddistnaceofthepassenger == 15000) {
        Firestore.instance
            .collection('Achievements')
            .document(rideguest)
            .updateData({
          "15 ton": true,
        });
      }

      print("the actual distance is " + distnacecoveredinkilo.toString());
    }
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
    print("the ride guest  email is " + rideguest);
  }

  gettheoldistanceofthedriver() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              olddistnaceofthedriver = (doc["distance covered"]);
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
              co2passenger = (doc["CO2passenger"]);
            }));
  }

  getco2driver() {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              co2driver = (doc["CO2driver"]);
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
              olddistnaceofthepassenger = (doc["distance covered"]);
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
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    (status == true)
                        ? new Text("The Distance is " +
                            " " +
                            distnacecoveredinkilo.toString())
                        : new Container(),
                    (status == true)
                        ? new Text(
                            "The Price is " + rideprice.toString() + " " + "LE")
                        : new Container(),
                  ],
                ),
              ),
              (star == true)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new Text(
                          "please rate the passenger who had ride with you "),
                    )
                  : new Container(),
              (star == true)
                  ? SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        rating = v;
                        String actualrate = rating.toString();

                        setState(() {
                          print("the given rate is " + rating.toString());

                          actualrate = ((rating + double.parse(passengerrate)) /
                                  Number_Of_Rides_As_guest)
                              .toString();
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

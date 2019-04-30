import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocator/geolocator.dart';


//api key
//
//                    AIzaSyCyFQYn6zzr5iBLdKubi8GvaDu6tyWKE_Q

class MapsNavigation extends StatefulWidget {
  String start;
  Position position;
  String rideguest;
  FirebaseUser firebaseuser;

  MapsNavigation(this.position, this.firebaseuser, this.rideguest);

  @override
  _MapsNavigationState createState() =>
      _MapsNavigationState(position, firebaseuser, rideguest);
}

class _MapsNavigationState extends State<MapsNavigation> {

  int olddistnaceofthedriver;
  int olddistnaceofthepassenger;
  final GlobalKey<ScaffoldState> _scaffoldstate =
  new GlobalKey<ScaffoldState>();
  bool status = false;
  double distanceInMeters;
  double rideprice;

  double distnacecoveredinkilo;
  Position startposition;
  FirebaseUser firebaseuser;
  String rideguest;

  _MapsNavigationState(this.startposition, this.firebaseuser, this.rideguest);

  double overallDriver;
  double overallPassenger;


//  Future _incrementCounter() async {
//
//    setState(() {
////      End=position.toString();
//      print("my current latitude in the second screen of the start  postion is "+startposition.longitude.toString());
//      status=true;
////      print("the status now is "+status.toString());
//
//
//    });
//
//    //
//  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

//  static final CameraPosition _kLake = CameraPosition(
//      bearing: 192.8334901395799,
//      target: LatLng(37.43296265331129, -122.08832357078792),
//      tilt: 59.440717697143555,
//      zoom: 19.151926040649414);


  Future getLocation() async {
    Position positionend = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //  ;
//    distanceInMeters = await Geolocator().distanceBetween(startposition.latitude,startposition.longitude, positionend.latitude,positionend.longitude);

    distanceInMeters =
    await Geolocator().distanceBetween(31.1143, 30.94012, 29.30995, 30.8418);
    distnacecoveredinkilo = distanceInMeters.round() / 1000;

    overallDriver = distnacecoveredinkilo + olddistnaceofthedriver;
    overallPassenger =
        distnacecoveredinkilo + olddistnaceofthepassenger;
    rideprice = distnacecoveredinkilo * 1.0.round();

// here we updated the distance travelled by the car owner
    Firestore.instance.collection('users')
        .document(firebaseuser.email)
        .updateData({
      "distance covered": overallDriver.round(),
    });

    //  we  UPDATEed the distance travelled by the ride guest (passenger)
    Firestore.instance.collection('users').document(rideguest).updateData({
      "distance covered": overallPassenger.round(),
    });
    setState(() {
      status = true;

      print("the old distance of the driver is " +
          olddistnaceofthedriver.toString());
      print("the old distance of the passenger is " +
          olddistnaceofthepassenger.toString());
    });

//here we check for co2 saved for showing achievements
    // we will start with the driver

    // then the same for the passenger
    if (olddistnaceofthedriver == 1000 || olddistnaceofthedriver == 3000 ||
        olddistnaceofthedriver == 5000 || olddistnaceofthedriver == 10000 ||
        olddistnaceofthedriver == 20000 || olddistnaceofthedriver == 30 ||
        olddistnaceofthedriver == 40000 || olddistnaceofthedriver == 50000) {
      _scaffoldstate.currentState
          .showSnackBar(new SnackBar(content: new Text(
          "Congurtlation new Achievement is reached you have saved   " +
              olddistnaceofthedriver.toString() + "KM" +
              " of C02 to the environment")));

      print("congurtlation new achievement is reached");
      if (olddistnaceofthedriver == 500) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "0.5 ton": true,

        });
      }
      if (olddistnaceofthedriver == 1000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "1 ton": true,

        });
      }
      if (olddistnaceofthedriver == 3000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "3 ton": true,

        });
      }

      if (olddistnaceofthedriver == 5000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "5 ton": true,

        });
      }
      if (olddistnaceofthedriver == 10000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "10 ton": true,

        });
      }
      if (olddistnaceofthedriver == 11000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "11 ton": true,

        });
      }
      if (olddistnaceofthedriver == 12000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "30 ride": true,

        });
      }
      if (olddistnaceofthedriver == 40000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "12 ton": true,

        });
      }
      if (olddistnaceofthedriver == 13000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "13 ton": true,

        });
      }
      if (olddistnaceofthedriver == 14000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "14 ton": true,

        });
      }
      if (olddistnaceofthedriver == 15000) {
        Firestore.instance.collection('Achievements')
            .document(firebaseuser.email)
            .updateData({
          "15 ton": true,

        });
      }


      print("the actual distance is " + distnacecoveredinkilo.toString());
    }


/////////////////////////////////////////////this part needs to be updated over all saving of environment///

  //  n7sb his total distance we awrelo hwa 3ml save ll environment ad eh until now

    if (olddistnaceofthepassenger == 1000 || olddistnaceofthepassenger == 3000 ||
        olddistnaceofthepassenger == 5000 || olddistnaceofthepassenger == 10000 ||
        olddistnaceofthepassenger == 20000 || olddistnaceofthepassenger == 30 ||
        olddistnaceofthepassenger == 40000 || olddistnaceofthepassenger == 50000) {
//      _scaffoldstate.currentState
//          .showSnackBar(new SnackBar(content: new Text(
//          "Congurtlation new Achievement is reached you have saved   " +
//              olddistnaceofthepassenger.toString() + "KM" +
//              " of C02 to the environment")));

      print("congurtlation new achievement is reached");
      if (olddistnaceofthepassenger == 500) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "0.5 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 1000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "1 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 3000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "3 ton": true,

        });
      }

      if (olddistnaceofthepassenger == 5000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "5 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 10000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "10 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 11000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "11 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 12000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "30 ride": true,

        });
      }
      if (olddistnaceofthepassenger == 40000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "12 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 13000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "13 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 14000) {
        Firestore.instance.collection('Achievements')
            .document(rideguest)
            .updateData({
          "14 ton": true,

        });
      }
      if (olddistnaceofthepassenger == 15000) {
        Firestore.instance.collection('Achievements')
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

      print("the ride guest  email is " + rideguest);
//    getLocation();
      //   print("the current start value is "+start);

    }

    gettheoldistanceofthedriver() {
      Firestore.instance
          .collection('users')
          .where("email", isEqualTo: firebaseuser.email)
          .snapshots()
          .listen((data) =>
          data.documents.forEach((doc) {
            //olddistance="sds";

            olddistnaceofthedriver = (doc["distance covered"]);
          }));
    }



    gettheoldistanceofthePassenger() {
      Firestore.instance
          .collection('users')
          .where("email", isEqualTo: rideguest)
          .snapshots()
          .listen((data) =>
          data.documents.forEach((doc) {
            //olddistance="sds";

            olddistnaceofthepassenger = (doc["distance covered"]);
          }));
    }


    @override
    Widget build(BuildContext context) {
//    int distance=233;
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

                      (status == true) ? new Text("The Distance is " + " " +
                          distnacecoveredinkilo.toString()) : new Container(),
                      (status == true)
                          ? new Text(
                          "The Price is " + rideprice.toString() + " " + "LE")
                          : new Container(),

                    ],


//
//          child: SingleChildScrollView(
//            child: new Column(
////            mainAxisAlignment: MainAxisAlignment.center,
////            crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//
//
//
//    ],
                  ),
                )
              ],
            ),
          ),
        ),

      );
    }
  }

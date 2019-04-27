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
  FirebaseUser firebaseuser;
  MapsNavigation(this.position, this.firebaseuser);

  @override
  _MapsNavigationState createState() => _MapsNavigationState(position,firebaseuser);
}

class _MapsNavigationState extends State<MapsNavigation> {

  double olddistnaceoftheuser;
  bool status =false;
  double distanceInMeters;
  double rideprice ;
  double distnacecoveredinkilo;
  Position startposition;
  FirebaseUser firebaseuser;
  _MapsNavigationState(this. startposition, this. firebaseuser);
  double overall;

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
    Position positionend = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //  ;

    distanceInMeters = await Geolocator().distanceBetween(31.1143,30.94012, 29.30995, 30.8418);
     distnacecoveredinkilo=distanceInMeters/1000;

   overall= distnacecoveredinkilo+olddistnaceoftheuser ;
    rideprice = distnacecoveredinkilo*1.0;


    Firestore.instance.collection('users').document(firebaseuser.email).updateData({
      "distance covered": overall,
    });

//    distanceInMeters = await Geolocator().distanceBetween(startposition.latitude,startposition.longitude, positionend.latitude,positionend.longitude);
setState(() {
  status=true;

  print("the old distance of the user is "+olddistnaceoftheuser.toString());


});


//    30.0660° N, 31.4856° E




    print("the actual distance is "+distnacecoveredinkilo.toString());
  }

  @override
  void initState() {
    super.initState();
    gettheoldistance();
//    getLocation();
 //   print("the current start value is "+start);

  }

  gettheoldistance()  {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: firebaseuser.email)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
      //olddistance="sds";

      olddistnaceoftheuser= (doc["distance covered"]);
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
                  padding: const EdgeInsets.only(top:36.0),
                  child: RaisedButton(
                    child: Text('End The Ride'),
                    onPressed: getLocation,
                    color: Colors.green, //specify background color  of button from our list of colors
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    (status==true)?    new Text("The Distance is "+" "+distnacecoveredinkilo.toString()):new Container(),
                    (status==true)?new Text("The Price is "+ rideprice.toString()+" "+ "LE"):new Container(),

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
//import 'dart:async';
//import 'dart:io';
//import 'dart:math';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//
//class ProfilePage extends StatefulWidget {
//  FirebaseUser user;
//  final VoidCallback onSignedOut;
//  ProfilePage(this.user, this.onSignedOut);
//
//  @override
//  _ProfilePageState createState() => new _ProfilePageState(user, onSignedOut);
//}
//
//class _ProfilePageState extends State<ProfilePage> {
//  var profilePicUrl;
//  final VoidCallback onSignedOut;
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  var nickName = 'Tom';
//  StorageReference ref;
//  bool isLoading = false;
//
//  var val;
//
//  File selectedImage;
//
//  String newNickName;
//  String oldorcurrentimage;
//  FirebaseUser user;
//  _ProfilePageState(this.user, this.onSignedOut);
//
//  // else read the photo stored in the user database photourl
//  @override
//  initState() {
//    // TODO: implement initState
//    super.initState();
//    print("the current user inside the profile is " + user.email);
//
//    Firestore.instance
//        .collection('users')
//        .where("uid", isEqualTo: user.uid)
//        .snapshots()
//        .listen((data) => data.documents.forEach((doc) {
//              oldorcurrentimage = doc.data['photo_url'];
//            }));
//
//    FirebaseAuth.instance.currentUser().then((user) {
//      setState(() {
//        nickName = user.displayName;
//      });
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  Future selectPhoto() async {
//    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
//
//    setState(() {
//      selectedImage = tempImage;
////
//      uploadPic(context);
//    });
//  }
//
//  Future uploadPic(BuildContext context) async {
//    final String fileName = "${Random().nextInt(1000000)}.jpg" + "signupData";
//    StorageReference firebaseStorageRef =
//        FirebaseStorage.instance.ref().child(fileName);
//    StorageUploadTask uploadTask = firebaseStorageRef.putFile(selectedImage);
//    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//
//    val = await firebaseStorageRef.getDownloadURL();
//    print("the image url should be " + val);
//
//    setState(() {
//      profilePicUrl = val;
//    });
//
//    var userUpdateInfo = new UserUpdateInfo();
//    userUpdateInfo.photoUrl = profilePicUrl;
//    user.updateProfile(userUpdateInfo);
//    FirebaseAuth.instance.currentUser().then((user) {
//      Firestore.instance
//          .collection('/users')
//          .where('uid', isEqualTo: user.uid)
//          .getDocuments()
//          .then((docs) {
//        Firestore.instance
//            .document('/users/${docs.documents[0].documentID}')
//            .updateData({'photo_url': val}).then((val) {
//          print('Image Updated');
//        }).catchError((e) {
//          print("THE ERRORS ARE" + e);
//        });
//      }).catchError((e) {
//        print(e);
//      });
//    }).catchError((e) {
//      print(e);
//    });
//
//    setState(() {
//      print("Profile Picture uploaded");
//      Scaffold.of(context)
//          .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//    });
//  }
//
////    task.future.then((value) {
////
////
////  }
//
//  getLoader() {
//    return isLoading
//        ? Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              CircularProgressIndicator(),
//            ],
//          )
//        : Container();
//  }
//
////  Future<void> _signOut(BuildContext context) async {
////    try {
//////      final BaseAuth auth = AuthProvider.of(context).auth;
//////      await auth.signOut();
////      await FirebaseAuth.instance.signOut();
////      onSignedOut();
////    } catch (e) {
////      print(e);
////    }
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: AppBar(
//          elevation: 0.0,
//          backgroundColor: Colors.teal.withOpacity(0.8),
//          leading: new IconButton(
//            icon: new Icon(
//              Icons.arrow_back,
//            ),
//            onPressed: () => Navigator.of(context).pop(),
//          ),
//        ),
//        body: new Stack(
//          children: <Widget>[
//            ClipPath(
//              child: Container(color: Colors.teal.withOpacity(0.8)),
//              clipper: getClipper(),
//            ),
//            Positioned(
//                width: 350.0,
//                left: 4.0,
//                top: MediaQuery.of(context).size.height / 5,
//                child: Column(
//                  children: <Widget>[
//                    GestureDetector(
//                      onTap: () {
//                        selectPhoto();
//                      },
//                      child: Container(
//                          width: 150.0,
//                          height: 150.0,
//                          decoration: BoxDecoration(
//                              color: Colors.red,
//                              image: DecorationImage(
//                                  image: (profilePicUrl != null)
//                                      ? NetworkImage(profilePicUrl)
//                                      : (oldorcurrentimage != null)
//                                          ? NetworkImage(oldorcurrentimage)
//                                          : AssetImage("assets/download.jpg"),
//                                  fit: BoxFit.cover),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(75.0)),
//                              boxShadow: [
//                                BoxShadow(blurRadius: 7.0, color: Colors.black)
//                              ])),
//                    ),
//                    SizedBox(height: 20.0),
//                    getLoader(),
//                    SizedBox(height: 65.0),
//                    Text(
//                      nickName,
//                      style: TextStyle(
//                          fontSize: 30.0,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'Montserrat'),
//                    ),
//                    SizedBox(height: 75.0),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        Container(
//                            height: 30.0,
//                            width: 95.0,
//                            child: Material(
//                              borderRadius: BorderRadius.circular(20.0),
//                              shadowColor: Colors.blueAccent,
//                              color: Colors.blue,
//                              elevation: 7.0,
//                              child: GestureDetector(
//                                onTap: selectPhoto,
//                                child: Center(
//                                  child: Text(
//                                    'Edit Photo',
//                                    style: TextStyle(
//                                        color: Colors.white,
//                                        fontFamily: 'Montserrat'),
//                                  ),
//                                ),
//                              ),
//                            )),
//
//                      ],
//                    ),
//                  ],
//                ))
//          ],
//        ));
//  }
//}
//
//class getClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    var path = new Path();
//
//    path.lineTo(0.0, size.height / 1.9);
//    path.lineTo(size.width + 125, 0.0);
//    path.close();
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    // TODO: implement shouldReclip
//    return true;
//  }
//}

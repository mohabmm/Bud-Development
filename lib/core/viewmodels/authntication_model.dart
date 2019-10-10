import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:budupdated/core/utilities/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'base_model.dart';

class AuthServiceModel extends BaseModel {
  File imageFiles;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  Stream<FirebaseUser> get currentUser => _auth.onAuthStateChanged;

  bool _success;

  Future<String> pickSaveImage() async {
    imageFiles = await ImagePicker.pickImage(source: ImageSource.camera);
    final String fileName = "${Random().nextInt(1000000)}.jpg" + "signupData";
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = ref.putFile(imageFiles);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  signUp(TextEditingController emailController,
      TextEditingController passwordController) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;

    updateUserData(user);

    try {
      user.sendEmailVerification();
    } catch (e) {
      showSnackBar("error occured while sending verifcation email ");

      print('Something really unknown: $e');
    }
  }

  // save user document data in firestore data colection
  void signInWithEmailAndPassword(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;

    if (user != null && user.isEmailVerified) {
      _success = true;
      Navigator.pushNamed(context, 'homeview');
    } else {
      showSnackBar("we send verfication email to your email please verify it ");

      _success = false;
    }
  }

  readImages(
      BuildContext context, String newNickName, String oldorcurrentimage) {
    var user = Provider.of<FirebaseUser>(context);

    _db
        .collection('users')
        .where("uid", isEqualTo: user.uid)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              oldorcurrentimage = doc.data['photo_url'];
            }));

    FirebaseAuth.instance.currentUser().then((user) {
      newNickName = user.displayName;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection('users').document(user.uid);

    return reportRef.setData(
      {
        'uid': user.uid,
        'email': user.email,
      },
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

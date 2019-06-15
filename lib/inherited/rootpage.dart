import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';
import '../splash_state.dart';
import 'auth.dart';
import 'authprovider.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final BaseAuth auth = AuthProvider.of(context).auth;
    auth.currentUser().then((String userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    (AuthStatus.signedIn) != null ? getUser() : print("moha");
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return SplashState();
      case AuthStatus.signedIn:
        return HomePage(
          onSignedOut: _signedOut,
          user: (mCurrentUser != null) ? mCurrentUser : mCurrentUser,
        );
    }
    return null;
  }

  Future<FirebaseUser> getUser() async {
    mCurrentUser = await _auth.currentUser();
    if (mCurrentUser != null) {
      print("the user email is " + mCurrentUser.email);
    }

    if (mCurrentUser != null) {
      return mCurrentUser;
    }
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

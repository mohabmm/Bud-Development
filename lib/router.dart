import 'package:budupdated/ui/views/achievements.dart';
import 'package:budupdated/ui/views/check_driver_status.dart';
import 'package:budupdated/ui/views/home_view.dart';
import 'package:budupdated/ui/views/landing_page.dart';
import 'package:budupdated/ui/views/profile.dart';
import 'package:budupdated/ui/views/sign_up_form.dart';
import 'package:budupdated/ui/views/signin_form.dart';
import 'package:budupdated/ui/views/tutorial_screen.dart';
import 'package:budupdated/ui/views/leaderboard.dart';
import 'package:budupdated/ui/views/enter_ride_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'tutorial':
        return MaterialPageRoute(builder: (_) => TutorialScreen());

      case 'landing':
        return MaterialPageRoute(builder: (_) => LandingPage());

      case 'homeview':
        return MaterialPageRoute(builder: (_) => HomeView());

      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile());

      case 'enterridedetails':
        var user = settings.arguments as FirebaseUser;

//        var user = Provider.of<FirebaseUser>(context);

        return MaterialPageRoute(builder: (_) => EnterRideDetails(user: user));

      case 'leaderboard':
        return MaterialPageRoute(builder: (_) => LeaderBoard());

      case 'achievements':
        return MaterialPageRoute(builder: (_) => Achievements());

//        CheckDriverStatus

      case 'checkDriverStatus':
        var user = settings.arguments as FirebaseUser;

        return MaterialPageRoute(
            builder: (_) => CheckDriverStatus(firebaseuser: user));

      case 'signupform':
        return MaterialPageRoute(builder: (_) => SignUpForm());

      case 'signinformem':
        return MaterialPageRoute(builder: (_) => SignInFormEmailAndPassword());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

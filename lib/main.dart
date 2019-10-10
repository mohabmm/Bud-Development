import 'package:budupdated/service_locator.dart';
import 'package:budupdated/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/scaffold_service.dart';
import 'core/viewmodels/authntication_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthServiceModel().currentUser,
      child: MaterialApp(
        title: 'Bud',
        navigatorKey: locator<ScaffoldService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan[600],
          accentColor: Colors.lightBlue[800],
        ),
        initialRoute: 'tutorial',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

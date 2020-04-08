import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
        accentColor: Colors.lightBlue[800],
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("sdsd"),
    );
  }
}

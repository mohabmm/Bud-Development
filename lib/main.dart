import 'package:budupdated/views/Signin.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BUD',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Signin(),
    );
  }
}

 import 'package:flutter/material.dart';

 class Achievements extends StatefulWidget {
   @override
   _AchievementsState createState() => _AchievementsState();
 }

 class _AchievementsState extends State<Achievements> {

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Achievements"),

       ),
       body:ListView(
         scrollDirection: Axis.vertical,

         children: <Widget>[
         Padding(padding:EdgeInsets.all(16.0),
           child: Container(
             child: Material(
               color: Colors.white,
               elevation:14.0 ,
               borderRadius: BorderRadius.circular(24.0),
               shadowColor: Color(0x802196F3),
             ),
           ),

 ) ,
 ],
 ) ,
 );
 }
 }
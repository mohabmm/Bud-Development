 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 class Achievements extends StatefulWidget {

   FirebaseUser user;
  Achievements(this. user);

   @override
   _AchievementsState createState() => _AchievementsState(user);
 }

 class _AchievementsState extends State<Achievements> {
   FirebaseUser user;
  _AchievementsState(this. user);


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Achievements"),

       ),
       body: StreamBuilder<QuerySnapshot>(
         stream: Firestore.instance.collection('Achievements').

         where("email", isEqualTo: user.email).
         snapshots(),
         builder: (BuildContext  context, AsyncSnapshot<QuerySnapshot>  snapshot) {
           if (!snapshot.hasData) {
             return Center(child: new Text("No Achievement Reached Yet"));
           }
           if (snapshot.hasError) {
             return new Text('Error: ${snapshot.error}');
           } else if (snapshot.hasData) {
             switch (snapshot.connectionState) {
               case ConnectionState.waiting:
                 return new Text('Loading...');
               default:
               print("the lenght is"+snapshot.data.documents.length.toString());
                 return ListView.builder(
                     itemExtent: 220.0,
                     itemCount: 53,
                     itemBuilder: (BuildContext context, int index) {
                       bool oneride =
                       snapshot.data.documents[index].data['first ride'];

                       return Padding(padding: EdgeInsets.all(16.0),
                         child: Container(
                           child: Material(
                             color: Colors.white,
                             elevation: 14.0,
                             borderRadius: BorderRadius.circular(24.0),
                             shadowColor: Color(0x802196F3),
                             child: Row(
                               children: <Widget>[
                                 new Expanded(
                                   child: Container(
                                       child: new Container(
                                         child: new Column(
                                           mainAxisSize: MainAxisSize.min,
                                           children: <Widget>[
                                             ListTile(
                                               subtitle: Padding(
                                                 padding: const EdgeInsets.only(
                                                     top: 0.0),
                                                 child: Row(
                                                   children: <Widget>[

                                                     new Container(
                                                       width: 100.0,
                                                       height: 100.0,
                                                       decoration: new BoxDecoration(
                                                         color: const Color(
                                                             0xff7c94b6),
                                                         image: new DecorationImage(
                                                           image:
                                                           new NetworkImage(
                                                               'http://i.imgur.com/QSev0hg.jpg'),
                                                           fit: BoxFit.cover,
                                                         ),
                                                         borderRadius:
                                                         new BorderRadius.all(
                                                             new Radius
                                                                 .circular(
                                                                 50.0)),
                                                         border: new Border.all(
                                                           color: Colors.white,
                                                           width: 4.0,
                                                         ),
                                                       ),
                                                     ),
//                                           X = COND ? A : B;


                                                     oneride==true?
                                           Expanded(
                                                       child: Padding(
                                                         padding: const EdgeInsets
                                                             .only(
                                                             left: 4.0),


                                                         child: new Text(
                                                           "One Ride in The app",
                                                           style: new TextStyle(
                                                             fontWeight: FontWeight
                                                                 .bold,
                                                             fontSize: 23.0,
                                                             color: Colors
                                                                 .black,
                                                           ),
                                                         ),
                                                       ),
                                                     ):new Text("a7a"),

                                                   ],
                                                 ),
                                               ),
                                             ),


                                           ],
                                         ),


                                       )
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),

                       );
                     }
                 );
             }
           }
         }
     )


     );
     }
   }





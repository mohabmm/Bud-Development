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
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index) {
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
                                                     Expanded(
                                                       child: Padding(
                                                         padding: const EdgeInsets
                                                             .only(
                                                             left: 18.0),
                                                         child: new Text(
                                                           "hjh",
                                                           style: new TextStyle(
                                                             fontWeight: FontWeight
                                                                 .bold,
                                                             fontSize: 23.0,
                                                             color: Colors
                                                                 .black,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                     Expanded(
                                                       child: new IconButton(
                                                         icon: Center(
                                                           child: Padding(
                                                             padding: const EdgeInsets
                                                                 .only(
                                                                 bottom: 60.0),
                                                             child: new Icon(
                                                               Icons
                                                                   .arrow_forward,
                                                               size: 40.0,
                                                             ),
                                                           ),
                                                         ),
                                                         onPressed: () =>
                                                             print(
                                                                 "hello moha"),
                                                       ),
                                                     ),
                                                     Expanded(
                                                       child: new Padding(
                                                         padding: EdgeInsets
                                                             .fromLTRB(
                                                             0.0, 0.0, 0.0,
                                                             0.0),
                                                         child: new Text(
                                                           //To,
                                                           "lll",
                                                           style: new TextStyle(
                                                             fontSize: 23.0,
                                                             fontWeight: FontWeight
                                                                 .bold,
                                                             color: Colors
                                                                 .black,
                                                           ),
                                                         ),
                                                       ),
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ),

                                             Padding(
                                               padding: const EdgeInsets
                                                   .fromLTRB(
                                                   8.0, 0.0, 0.0, 0.0),
                                               child: new Row(
                                                 // make buttons use the appropriate styles for cards

                                                 mainAxisAlignment: MainAxisAlignment
                                                     .spaceBetween,
                                                 children: <Widget>[


                                                   Padding(
                                                     padding:
                                                     const EdgeInsets.only(
                                                         bottom: 6.0,
                                                         left: 30.0),

                                                     child: new Text(
                                                       "jhjh",
                                                       style: new TextStyle(
                                                         fontSize: 18.0,
                                                       ),
                                                     ),


                                                   ),

                                                   Padding(

                                                     padding: const EdgeInsets
                                                         .only(
                                                         bottom: 8.0,
                                                         right: 28.0),
                                                     child: Text("xxxcx",
                                                       style: TextStyle(
                                                           fontSize: 18.0),),
                                                   ),
                                                 ],
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





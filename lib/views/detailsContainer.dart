 import 'package:flutter/material.dart';

 class Mock extends StatefulWidget {
   @override
   _MockState createState() => _MockState();
 }

 class _MockState extends State<Mock> {

   @override
   Widget build(BuildContext context) {



       return  new Container(
     child: new Column(
     mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         ListTile(
//           title: Padding(
//
//             padding: const EdgeInsets.only(top: 8.0),
//             child:  Text("2:48 PM",style: TextStyle(fontSize: 22.0),),
//           ),
           subtitle: Padding(
             padding: const EdgeInsets.only(top: 0.0),
             child: Row(
               children: <Widget>[

                 new Container(
                   width: 100.0,
                   height: 100.0,
                   decoration: new BoxDecoration(
                     color: const Color(0xff7c94b6),
                     image: new DecorationImage(
                       image:
                       new NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                       fit: BoxFit.cover,
                     ),
                     borderRadius:
                     new BorderRadius.all(new Radius.circular(50.0)),
                     border: new Border.all(
                       color: Colors.white,
                       width: 4.0,
                     ),
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.only(left:18.0),
                     child: new Text(
                       "Msa",
                       style: new TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 23.0,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   child: new IconButton(
                     icon: Center(
                       child: Padding(
                         padding: const EdgeInsets.only(bottom:60.0),
                         child: new Icon(
                           Icons.arrow_forward,
                             size: 40.0,
                             ),
                       ),
                     ),
                     onPressed: () => print("hello moha"),
                   ),
                 ),
                 Expanded(
                   child: new Padding(
                     padding: EdgeInsets.fromLTRB(
                         0.0, 0.0, 0.0, 0.0),
                     child: new Text(
                       //To,
                       "Rehab city",
                       style: new TextStyle(
                         fontSize: 23.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 )
               ],
             ),
           ),
         ),

            Padding(
             padding: const EdgeInsets.fromLTRB(
                 8.0, 0.0, 0.0, 0.0),
             child: new Row(
               // make buttons use the appropriate styles for cards
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[


                    Padding(
                     padding:
                     const EdgeInsets.only(bottom: 6.0,left: 0.0),

                       child: new Text(
                         "Mohab Magdy",
                         style: new TextStyle(
                           fontSize: 18.0,
//                           fontWeight: FontWeight.w600,
                         ),
                       ),


                 ),

                    Padding(

                      padding: const EdgeInsets.only(bottom: 8.0,right: 28.0),
                      child:  Text("2:48 PM",style: TextStyle(fontSize: 18.0),),
                    ),
               ],
             ),
           ),

       ],
     ),




     );
   }
 }
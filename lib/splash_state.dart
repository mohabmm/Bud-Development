import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashState extends StatefulWidget{
  @override
  StateClass createState() => StateClass();

}
class StateClass extends State<SplashState>{

  @override
  void initState() {
    super.initState();
    getIntro();
  }

  void getIntro()async{
    var prefs=await SharedPreferences.getInstance();
    if(prefs.getBool("intro").toString()=="null"){
      Navigator.pushNamed(context, "MySplashScreen");
    }else{
      Navigator.pushNamed(context, "Signin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}
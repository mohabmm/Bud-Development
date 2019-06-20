import 'package:budupdated/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key key}) : super(key: key);

  @override
  MySplashScreenState createState() => new MySplashScreenState();
}

// Custom config
class MySplashScreenState extends State<MySplashScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    saveIntro();

    slides.add(
      new Slide(
        title: "Welcome to our carpooling app BUD",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Let's make friends, reduce congestion, arrive faster in a luxury ride with an affordable price and make a dent in our current air pollution crisis! ",
        key: Key("slide"),
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("", style: TextStyle(color: Colors.white)),
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        backgroundImage: 'screen/first.jpg',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Join us!",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Our app is easily used, just sign up, create your account then offer or join a ride!",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "How competitive are you?!",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "With more rides,get discount codes!Get badges by completing more tasks and see how well you are doing compared to others using the leaderboard!",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 17.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void saveIntro() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("intro", true);
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signin()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      key: Key("PINKBUTTON"),
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,
      key: Key("intro"),

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,

      // Locale
      // locale: 'en',

      // Show or hide status bar
      shouldHideStatusBar: true,
    );
  }
}

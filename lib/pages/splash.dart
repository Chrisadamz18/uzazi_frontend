import 'dart:async';
import 'package:flutter/material.dart';
import './welcomeoption.dart';
// import '/pages/welcomeoption.dart';
// import '/screen/splash2.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => welcomeOption()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/logo.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 18.0)),
            Text(
              "Be in charge of your reproductive health!",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff39065a),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}

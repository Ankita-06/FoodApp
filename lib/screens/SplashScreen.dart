import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_foodapp/screens/Home/HomePage.dart';
import 'package:flutter_foodapp/screens/OnBoard/onboarding_one.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingOne()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 6), () {
      checkFirstSeen();
    });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    Text(
                      'foodie moodie',
                      style: GoogleFonts.aclonica(
                          textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange)),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
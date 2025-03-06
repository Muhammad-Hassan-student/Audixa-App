import 'dart:async';

import 'package:audixa/Pages/CheckAuth.dart';
import 'package:audixa/Pages/MyHome.dart';
import 'package:audixa/Pages/Signup.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Checkauth()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/spalsh.jpeg"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Audixa",
              style: TextStyle(
                  color: Colors.purple, fontFamily: "Charmonman", fontSize: 52),
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    ));
  }
}

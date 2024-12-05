import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Container(
      // width: width * 0.6,
      // height: width * 0.6,
      child: Lottie.network(
        'https://lottie.host/22cb8e7f-1115-4db0-8622-27e04bfab02f/7RvfM631lb.json',
        errorBuilder: (context, error, stackTrace) {
          return Text('Failed to load animation!');
        },
      ),
      // child: Image.asset(
      //   "assets/news.png",
      //   fit: BoxFit.contain,
      // ),
    )));
  }
}

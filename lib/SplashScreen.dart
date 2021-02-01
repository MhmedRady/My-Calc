import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Home.dart';
import 'Consts.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}
class _MySplashScreenState extends State<MySplashScreen>  with SingleTickerProviderStateMixin{
  AnimationController _controller;


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 40), vsync: this)
      ..animateTo(10.0,duration:Duration(seconds: 40));
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
                  CalcApp()
          )
        )
    );
  }
    @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Color(0xFF252525),
        body: Transform.rotate(angle: 150,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: RotationTransition(
              alignment: Alignment.center,
              turns: _controller,
              // decoration: MyChanges().myBodyBackG(),
              child: Image(image: AssetImage("image/CALC.png")),
              ),
            ),
          ),
        ),

      );
    }
  }

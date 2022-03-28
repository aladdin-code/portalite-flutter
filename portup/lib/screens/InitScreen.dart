import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/IntroductionScreen/IntroScreen.dart';
import 'package:portup/screens/SignInScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  bool foundToken = false;
  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isFirstTime = prefs.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      prefs.setBool('first_time', false);
      return false;
    } else {
      prefs.setBool('first_time', false);
      return true;
    }
  }

  void isThereToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isThereCurrentuser = prefs.getString('token');

    if (isThereCurrentuser != null && isThereCurrentuser.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.path);
      print("theeeeeeeeeeeeeeeeeeeeerrre is token");
      foundToken = true;
    } else {
      print(" nnnnnooooooooooooooo token");
    }
  }

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
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    isThereToken();

    Timer(const Duration(seconds: 1), () {
      isFirstTime().then((isFirstTime) {
        if (foundToken) {
          return;
        } else {
          isFirstTime
              ? Navigator.of(context)
                  .pushReplacementNamed(IntroductionScreen.path)
              : Navigator.of(context).pushReplacementNamed(SignInScreen.path);
        }
      });
    });
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/Logo-Portalite.png"),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              "Splash Screen",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            )
          ],
        ),
      ),
    );
  }
}

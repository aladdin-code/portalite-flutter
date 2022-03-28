import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/SignInScreen.dart';
import 'package:portup/screens/SignUpScreen/Slides/ProfileTypeSlide.dart';
import 'package:portup/screens/SignUpScreen/Slides/SetPhoneSlide.dart';
import 'package:portup/screens/SignUpScreen/Slides/SignUpCvSlide.dart';
import 'package:portup/screens/SignUpScreen/Slides/SignUpFormScreen.dart';

class SignUp extends StatefulWidget {
  static const path = "signup";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // List<SliderModel> mySLides = <SliderModel>[];
  int _slideIndex = 0;
  int _cureentIndex = 0;
  String profileType = "developper";

  // developper
  // entreprise
  final Color _activeColor = const Color.fromRGBO(254, 39, 126, 1);
  final Color _inactiveColor = const Color.fromRGBO(221, 221, 221, 1);
  final double lineWidth = 2.0;
  late PageController controller;

  final List<IconData> _icons = [
    Icons.input_rounded,
    Icons.person_add_alt_rounded,
    Icons.work_outline_rounded,
    Icons.check_rounded,
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // mySLides = getSlides();
    controller = PageController();
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _icons.asMap().forEach((i, icon) {
      //colors according to state
      var circleColor =
          (i == 0 || _cureentIndex > i) ? _activeColor : _inactiveColor;

      var lineColor = _cureentIndex > i + 1 ? _activeColor : _inactiveColor;

      var iconColor =
          (i == 0 || _cureentIndex >= i + 1) ? Colors.white : _activeColor;

      list.add(
        //dot with icon view
        Container(
          width: 30.0,
          height: 30.0,
          padding: const EdgeInsets.all(0),
          child: Icon(
            icon,
            color: iconColor,
            size: 15.0,
          ),
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(
              color: _activeColor,
              width: 2.0,
            ),
          ),
        ),
      );

      //line between icons
      if (i != _icons.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Scaffold(
          //  backgroundColor: const Color.fromRGBO(220, 220, 220, 0.2),
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0)),
                ),
                padding: const EdgeInsets.only(
                    right: 14.0, left: 14.0, top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: _iconViews(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    color: Colors.white70),
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: 8.0,
                  left: 8.0,
                ),
                height: MediaQuery.of(context).size.height - 170,
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _cureentIndex = index + 1;
                      _slideIndex = index;
                    });
                  },
                  children: const <Widget>[
                    ProfileTypeSlide(),
                    SingleChildScrollView(child: SignUpFormScreen()),
                    SIgnUpCvScreen(),
                    SetPhoneSlide(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.white70,
          padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    if (_slideIndex >= 1) {
                      setState(() {
                        --_cureentIndex;
                        --_slideIndex;
                      });
                      controller.animateToPage(_slideIndex,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.linear);
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    //
                    elevation: MaterialStateProperty.all(5), //Defines Elevation
                    shadowColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor), //Defines shadowColor
//
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  )),
              _cureentIndex == 3
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          ++_cureentIndex;
                          ++_slideIndex;
                        });
                        controller.animateToPage(_slideIndex,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linear);
                      },
                      child: Text(
                        "Skip for now",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : const SizedBox(),
              ElevatedButton(
                  onPressed: () {
                    if (_cureentIndex == 2 && profileType == "entreprise") {
                      setState(() {
                        _cureentIndex += 2;
                        _slideIndex += 2;
                      });
                      controller.animateToPage(_slideIndex,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.linear);
                    }
                    if (_cureentIndex == 4) {
                      Navigator.of(context).pushNamed(SignInScreen.path);
                      return;
                    }
                    if (_cureentIndex < 4) {
                      // print("this is slideIndex: $slideIndex");

                      setState(() {
                        ++_cureentIndex;
                        ++_slideIndex;
                      });
                      controller.animateToPage(_slideIndex,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.linear);
                    }
                  },
                  child: _cureentIndex < 4
                      ? const Text(
                          "NEXT",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

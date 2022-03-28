import 'package:flutter/material.dart';
import 'package:portup/screens/SignUpScreen/Slides/SkillCard.dart';

class SIgnUpCvScreen extends StatefulWidget {
  const SIgnUpCvScreen({Key? key}) : super(key: key);

  @override
  _SIgnUpCvScreenState createState() => _SIgnUpCvScreenState();
}

class _SIgnUpCvScreenState extends State<SIgnUpCvScreen> {
  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0), topLeft: Radius.circular(30)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 5.0),
        child: SkillCard(),
      ),
    );
  }
}

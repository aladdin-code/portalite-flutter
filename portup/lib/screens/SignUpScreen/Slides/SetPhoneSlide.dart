import 'package:flutter/material.dart';

class SetPhoneSlide extends StatefulWidget {
  const SetPhoneSlide({Key? key}) : super(key: key);

  @override
  _SetPhoneSlideState createState() => _SetPhoneSlideState();
}

class _SetPhoneSlideState extends State<SetPhoneSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: Column(
          children: [
            Icon(
              Icons.check_rounded,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Account Created Succeffuly ",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You are donne creating your account click the Sign In Button to login to your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ));
  }
}

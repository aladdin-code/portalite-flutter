import 'package:flutter/material.dart';
import 'package:portup/screens/SignUpScreen/SignUpScreen.dart';
import 'package:portup/widgets/AppDrawer.dart';

class FacturationScreen extends StatefulWidget {
  static const path = "facturation";
  const FacturationScreen({Key? key}) : super(key: key);

  @override
  _FacturationScreenState createState() => _FacturationScreenState();
}

class _FacturationScreenState extends State<FacturationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facturation"),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: ElevatedButton(
          child: const Text("Deconnecter facturation"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignUp.path);
          },
        ),
      ),
    );
  }
}

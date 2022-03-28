import 'package:flutter/material.dart';
import 'package:portup/screens/SignUpScreen/SignUpScreen.dart';
import 'package:portup/widgets/AppDrawer.dart';

class FinanceScreen extends StatefulWidget {
  static const path = "finance";
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finance"),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: ElevatedButton(
          child: const Text("Deconnecter Financiers"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignUp.path);
          },
        ),
      ),
    );
  }
}

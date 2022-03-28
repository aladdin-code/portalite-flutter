import 'package:flutter/material.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/widgets/AdminAppDrawer.dart';
import 'package:portup/widgets/AppDrawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const path = "home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAdmin = false;
  @override
  void initState() {
    // TODO: implement initState
    checkIsAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: isAdmin ? AdminAppDrawer() : AppDrawer(),
      body: const Center(
        child: Text("this is home"),
      ),
    );
  }

  void checkIsAdmin() {
    setState(() {
      isAdmin = Provider.of<FreelancerProvider>(context, listen: false)
          .currentFreelancer
          .admin;
    });
  }
}

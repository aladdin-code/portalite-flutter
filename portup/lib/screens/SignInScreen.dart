import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/SignUpScreen/SignUpScreen.dart';
import 'package:portup/screens/SignUpScreen/Slides/SignUpFormScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/constants.dart' as constants;

class SignInScreen extends StatefulWidget {
  static const path = "signIn";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String userID = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            height: 350.0,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/wave.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Veuillez entrer votre email");
                                }
                                // reg expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Veuillez entrer un email valide");
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                                prefixStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Enter votre Mots De passe");
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: CupertinoButton(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100),
                              onPressed: () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    _formKey.currentState!.save(),
                                    Provider.of<FreelancerProvider>(context,
                                            listen: false)
                                        .signIn(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            context: context),
                                  }
                              },
                              pressedOpacity: 0.5,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CupertinoButton(
                            onPressed: () => {},
                            child: const Text(
                              'FORGOT PASSWORD?',
                              style: TextStyle(
                                color: Color.fromRGBO(52, 137, 246, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Dont have an account?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 4),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  Navigator.of(context)
                                      .pushReplacementNamed(SignUp.path)
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        top: 128,
                        right: 0,
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: Image.asset(
                            'assets/images/Logo-Portalite.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

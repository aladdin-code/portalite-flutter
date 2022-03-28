import 'package:flutter/material.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/AcitvitiesScreen.dart';
import 'package:portup/screens/FacurationScreen.dart';
import 'package:portup/screens/GestionDocScreen.dart';
import 'package:portup/screens/GestionFinancierScreen.dart';
import 'package:portup/screens/GestionFraisScreen.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/InitScreen.dart';
import 'package:portup/screens/IntroductionScreen/IntroScreen.dart';
import 'package:portup/screens/Profile/EditProfileScreen.dart';
import 'package:portup/screens/Profile/ProfileScreen.dart';
import 'package:portup/screens/SignInScreen.dart';
import 'package:portup/screens/SignUpScreen/Slides/SignUpFormScreen.dart';
import 'package:portup/screens/SignUpScreen/SignUpScreen.dart';
import 'package:portup/screens/TestPage.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FreelancerProvider())
        ],
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PortUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          const Color.fromRGBO(2, 207, 170, 1).value,
          const {
            50: Color.fromRGBO(2, 207, 170, 0.5),
            100: Color.fromRGBO(2, 207, 170, 1),
            200: Color.fromRGBO(2, 207, 170, 2),
            300: Color.fromRGBO(2, 207, 170, 3),
            400: Color.fromRGBO(2, 207, 170, 4),
            500: Color.fromRGBO(2, 207, 170, 5),
            600: Color.fromRGBO(2, 207, 170, 6),
            700: Color.fromRGBO(2, 207, 170, 7),
            800: Color.fromRGBO(2, 207, 170, 8),
            900: Color.fromRGBO(2, 207, 170, 9),
          },
        ),

        primaryColor: const Color.fromRGBO(2, 207, 170, 1),
        primaryColorDark: const Color.fromRGBO(2, 207, 170, 1),
        focusColor: const Color.fromRGBO(196, 196, 196, 1),
        errorColor: const Color.fromRGBO(255, 0, 0, 1),
        backgroundColor: const Color.fromRGBO(2, 207, 170, 1),
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
      routes: {
        "/": (context) => SplashScreen(),
        IntroductionScreen.path: (context) => IntroductionScreen(),
        SignUp.path: (context) => const SignUp(),
        SignUpFormScreen.path: (context) => const SignUpFormScreen(),
        HomeScreen.path: (context) => const HomeScreen(),
        ActivitiesScreen.path: (context) => const ActivitiesScreen(),
        DocsScreen.path: (context) => const DocsScreen(),
        FacturationScreen.path: (context) => const FacturationScreen(),
        FinanceScreen.path: (context) => const FinanceScreen(),
        ProfileScreen.path: (context) => const ProfileScreen(),
        SignInScreen.path: (context) => const SignInScreen(),
        EditProfileScreen.path: (context) => const EditProfileScreen(),
        TestPage.path: (context) => const TestPage(),
        GestionFraisScreen.path: (context) => const GestionFraisScreen(),
      },
    );
  }
}

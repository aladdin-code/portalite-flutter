import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portup/models/Freelancer.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/Constants.dart' as constants;
import 'dart:convert';

class FreelancerProvider extends ChangeNotifier {
  bool isFirstTime = true;
  late Freelancer currentFreelancer = Freelancer(
      email: "",
      firstName: "",
      lastName: "",
      phone: 0,
      token: "",
      image: "",
      sexe: "",
      admin: false);

  void signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Map<String, dynamic> userData = {"email": email, "password": password};

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(constants.baseUrl, "/api/freelancer/login"),
            headers: headers, body: json.encode(userData))
        .then((http.Response response) {
      if (response.statusCode == 200) {
        //     String userToken = json.decode(response.body)["token"].toString();

        currentFreelancer.setFirstName =
            json.decode(response.body)["freelancer"]["firstname"].toString();
        currentFreelancer.setLastName =
            json.decode(response.body)["freelancer"]["lastname"].toString();
        currentFreelancer.setEmail =
            json.decode(response.body)["freelancer"]["email"].toString();
        currentFreelancer.setPhone = 0;
        currentFreelancer.setToken =
            json.decode(response.body)["token"].toString();
        currentFreelancer.setSexe =
            json.decode(response.body)["freelancer"]["sexe"].toString();
        currentFreelancer.setImage = '/' +
            json
                .decode(response.body)['freelancer']['image']
                .toString()
                .substring(8);

        addToken(json.decode(response.body)["token"].toString());
        addDataToSharedPref(
            currentFreelancer.firstName,
            currentFreelancer.lastName,
            currentFreelancer.email,
            currentFreelancer.sexe,
            currentFreelancer.image,
            currentFreelancer.admin);
        if (json.decode(response.body)['freelancer']['admin'] != null) {
          currentFreelancer.setAdmin =
              json.decode(response.body)['freelancer']['admin'];
        } else {
          currentFreelancer.setAdmin = false;
        }

        notifyListeners();
        Navigator.pushReplacementNamed(context, HomeScreen.path);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Information"),
              content: Text(
                  "Une erreur s'est produite, veuillez réessayer plus tard !"),
            );
          },
        );
      }
    });
  }

  void logout() {
    currentFreelancer.setFirstName = '';
    currentFreelancer.setLastName = '';
    currentFreelancer.setEmail = '';
    currentFreelancer.setPhone = 0;
    currentFreelancer.setToken = '';
    currentFreelancer.admin = false;
    currentFreelancer.sexe = "";
    removeToken();
    notifyListeners();
  }

  void addToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "");
  }

  void updateFreelancer(String email, String firstname, String lastname,
      String sexe, BuildContext context) async {
    Map<String, dynamic> userData = {
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "sexe": sexe,
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .put(Uri.http(constants.baseUrl, "/api/freelancer/editProfile"),
            headers: headers, body: json.encode(userData))
        .then((http.Response response) {
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Succès"),
              content: Text("Votre profil a été modifié avec succès"),
            );
          },
        );
        currentFreelancer.setFirstName =
            json.decode(response.body)["freelancer"]["firstname"].toString();
        currentFreelancer.setLastName =
            json.decode(response.body)["freelancer"]["lastname"].toString();
        currentFreelancer.setEmail =
            json.decode(response.body)["freelancer"]["email"].toString();
        currentFreelancer.setPhone = 0;
        currentFreelancer.setToken =
            json.decode(response.body)["token"].toString();
        currentFreelancer.setSexe =
            json.decode(response.body)["freelancer"]["sexe"].toString();
        currentFreelancer.setImage = '/' +
            json
                .decode(response.body)['freelancer']['image']
                .toString()
                .substring(8);

        addToken(json.decode(response.body)["token"].toString());
        addDataToSharedPref(
            currentFreelancer.firstName,
            currentFreelancer.lastName,
            currentFreelancer.email,
            currentFreelancer.sexe,
            currentFreelancer.image,
            currentFreelancer.admin);
        if (json.decode(response.body)['freelancer']['admin'] != null) {
          currentFreelancer.setAdmin =
              json.decode(response.body)['freelancer']['admin'];
        } else {
          currentFreelancer.setAdmin = false;
        }

        notifyListeners();
      } else {
        // return 0;
      }
    });
  }

  void addDataToSharedPref(
    String firstName,
    String lastName,
    String email,
    String sexe,
    String image,
    bool admin,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstName);
    prefs.setString('lastName', lastName);
    prefs.setString('email', email);
    prefs.setString('sexe', sexe);
    prefs.setString('image', image);
    prefs.setBool("admin", admin);
  }
}

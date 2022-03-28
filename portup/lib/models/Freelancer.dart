import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Freelancer {
  String firstName;
  String lastName;
  int phone;
  String email;
  String token;
  String image;
  bool admin;
  String sexe;

  set setAdmin(bool isAdmin) {
    admin = isAdmin;
  }

  set setSexe(String s) {
    sexe = s;
  }

  set setFirstName(String name) {
    firstName = name;
  }

  set setImage(String img) {
    image = img;
  }

  set setLastName(String name) {
    lastName = name;
  }

  set setPhone(int phoneNumber) {
    phone = phoneNumber;
  }

  set setEmail(String em) {
    email = em;
  }

  set setToken(String tok) {
    token = tok;
  }

  String get getFirstName {
    return firstName;
  }

  String get getSexe {
    return sexe;
  }

  bool get getAdmin {
    return admin;
  }

  String get getImage {
    return image;
  }

  String get getLastName {
    return lastName;
  }

  String get getEmail {
    return email;
  }

  int get getPhone {
    return phone;
  }

  String get getToken {
    return token;
  }

  Freelancer({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.token,
    required this.image,
    required this.admin,
    required this.sexe,
  });

  Freelancer.fromJson(Map<String, dynamic> json)
      : firstName = json["firstname"],
        email = json['email'],
        lastName = json['lastname'],
        token = json['token'],
        image = json['image'],
        phone = json['phone'],
        admin = json['admin'],
        sexe = json['sexe'];

  Map<String, dynamic> toJson() => {
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'token': token,
        'email': email,
        'admin': admin,
        'sexe': sexe,
      };
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/Profile/ProfileScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/../Constants/constants.dart' as constants;

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  static const path = "edit_profile";
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _imageUrl = "";
  File? image;
  Future pickImage(ImageSource imagesource) async {
    try {
      final image = await ImagePicker().pickImage(source: imagesource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to get imes : $e");
    }
  }

  // our form key
  final _formKey = GlobalKey<FormState>();
  // String _sexe = "";

  String groupValue = "";
  bool enabled = false;
  // editing Controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailFieldController = TextEditingController();

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('Prefs datattatattatatatattatatatata');
    print(prefs.getString('firstName')!);

    firstNameEditingController.text = prefs.getString('firstName')!;

    secondNameEditingController.text = prefs.getString("lastName")!;
    _imageUrl = 'http://' + constants.baseUrl + prefs.getString("image")!;

    emailFieldController.text = prefs.getString("email")!;
    // _sexe = prefs.getString("sexe")!;
    groupValue = prefs.getString("sexe")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    //first name field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailFieldController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          emailFieldController.text = value!;
        },
        enabled: false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "your.email@mail.com",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Le prénom ne peut pas être vide");
          }
          if (!regex.hasMatch(value)) {
            return ("Entrez un prénom valide (min. 3 caractères)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        onChanged: (value) {
          setState(() {
            enabled = true;
          });
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Prénom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Le nom ne peut pas être vide");
          }
          if (!regex.hasMatch(value)) {
            return ("Entrez un nom valide (min. 3 caractères)");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        onChanged: (value) {
          setState(() {
            enabled = true;
          });
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            margin: const EdgeInsets.only(top: 30.0),
            child: Stack(
              children: <Widget>[
                image == null
                    ? CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(_imageUrl),
                      )
                    : CircleAvatar(
                        radius: 50.0,
                        backgroundImage: FileImage(image!),
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 20.0, left: 20.0),
                                      width: double.infinity,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child:
                                            const Text("Select from Gallery"),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey[200]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 20.0, left: 20.0),
                                      width: double.infinity,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Select from Camera"),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey[200]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 20.0, left: 20.0),
                                      width: double.infinity,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel"),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ))),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          LineAwesomeIcons.pen,
                          color: Colors.black87,
                          size: 20.0,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: 20.0),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.path);
          },
          icon: const Icon(
            LineAwesomeIcons.arrow_left,
            size: 30.0,
          ),
        ),
        profileInfo,
        const SizedBox(width: 30.0),
        IconButton(
          onPressed: () {
            // save changes if exists
            setState(() {
              getUserData();
              enabled = false;
            });
          },
          icon: const Icon(
            Icons.restart_alt_outlined,
            size: 30.0,
          ),
        ),
      ],
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  header,
                  Container(
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ).copyWith(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromRGBO(210, 225, 250, 0.35),
                      ),
                      child: emailField),
                  Container(
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ).copyWith(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromRGBO(210, 225, 250, 0.35),
                      ),
                      child: firstNameField),
                  Container(
                      height: 45.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ).copyWith(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromRGBO(210, 225, 250, 0.35),
                      ),
                      child: secondNameField),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                    child: Text(
                      "Gender:",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: const Text("Homme"),
                    leading: Radio(
                      value: "Homme",
                      groupValue: groupValue,

                      onChanged: (value) {
                        setState(() {
                          groupValue = value!.toString();
                          enabled = true;
                        });
                      },
                      activeColor: Colors.green,
                      // toggleable: false,
                    ),
                  ),
                  ListTile(
                    title: const Text("Femme"),
                    leading: Radio(
                      //    autofocus: true,

                      value: "Femme",
                      //  toggleable: false,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!.toString();
                          enabled = true;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 10.0, bottom: 10.0)),
                        enableFeedback: enabled,
                        overlayColor: enabled
                            ? MaterialStateProperty.all(Colors.green[200])
                            : MaterialStateProperty.all(Colors.transparent),
                        backgroundColor: enabled
                            ? MaterialStateProperty.all(
                                Theme.of(context).primaryColor)
                            : MaterialStateProperty.all(Colors.grey[300]),
                      ),
                      onPressed: () {
                        Provider.of<FreelancerProvider>(context, listen: false)
                            .updateFreelancer(
                                emailFieldController.text,
                                firstNameEditingController.text,
                                secondNameEditingController.text,
                                groupValue,
                                context);
                        setState(() {
                          enabled = false;
                        });
                      },
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: enabled ? Colors.white : Colors.grey[800],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

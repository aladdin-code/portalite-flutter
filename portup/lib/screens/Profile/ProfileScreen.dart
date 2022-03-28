import 'package:flutter/material.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/Profile/EditProfileScreen.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:portup/screens/TestPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/../Constants/constants.dart' as constants;

import './ProfileItem.dart';

class ProfileScreen extends StatefulWidget {
  static const path = "profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = "cccccccccc";
  String _lastName = "dddd";
  String _email = "dddd";
  String _imageUrl = "";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("milll prefff" + prefs.getString('firstName')!);
    _userName = prefs.getString('firstName')!;
    _lastName = prefs.getString("lastName")!;
    _email = prefs.getString("email")!;
    _imageUrl = 'http://' + constants.baseUrl + prefs.getString("image")!;
    print(
        'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
    print(_imageUrl);

    print(
        'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, height: 896, width: 414,);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            margin: const EdgeInsets.only(top: 30.0),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(_imageUrl),
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
                    child: const Center(
                      heightFactor: 15.0,
                      widthFactor: 15.0,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: Colors.black87,
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            _userName.toUpperCase() + " " + _lastName.toUpperCase(),
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5.0),
          Text(
            _email,
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
            Navigator.of(context).pushReplacementNamed(HomeScreen.path);
          },
          icon: const Icon(
            LineAwesomeIcons.arrow_left,
            size: 30.0,
          ),
        ),
        profileInfo,
        const SizedBox(width: 30.0),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50.0),
          header,
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(EditProfileScreen.path);
                  },
                  child: const ProfileListItem(
                    key: Key("1"),
                    icon: LineAwesomeIcons.user_circle,
                    text: 'Mon Profile',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(TestPage.path);
                  },
                  child: const ProfileListItem(
                    key: Key("3"),
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Aide',
                  ),
                ),
                const ProfileListItem(
                  key: Key("2"),
                  icon: LineAwesomeIcons.history,
                  text: 'Historique',
                ),
                const ProfileListItem(
                  key: Key("4"),
                  icon: LineAwesomeIcons.cog,
                  text: 'Paramètres',
                ),
                ProfileListItem(
                  key: Key("5"),
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Inviter des Amis',
                ),
                ProfileListItem(
                  key: Key("6"),
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Deconnecter',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

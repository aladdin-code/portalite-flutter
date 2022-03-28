import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:portup/Providers/FreelancerProvider.dart';
import 'package:portup/screens/AcitvitiesScreen.dart';
import 'package:portup/screens/FacurationScreen.dart';
import 'package:portup/screens/GestionDocScreen.dart';
import 'package:portup/screens/GestionFinancierScreen.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/Profile/ProfileScreen.dart';
import 'package:portup/screens/SignInScreen.dart';
import 'package:portup/screens/SignUpScreen/SignUpScreen.dart';
import 'package:provider/provider.dart';

class AdminAppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/svg_background.jpg'))),
        child: Stack(children: const <Widget>[
          Positioned(
              bottom: 5.0,
              left: 16.0,
              child: Text("   Portalite",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            const Divider(
              height: 2.0,
            ),
            _createDrawerItem(
                icon: LineAwesomeIcons.home,
                text: 'Acceuil',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.path);
                } // discover projects
                ),
            _createDrawerItem(
                icon: LineAwesomeIcons.user_friends,
                text: 'Resource Humaine',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ActivitiesScreen.path);
                }),
            _createDrawerItem(
                icon: LineAwesomeIcons.paperclip,
                text: 'Gestion documentaires',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(DocsScreen.path);
                }),
            const Divider(
              height: 2.0,
            ),
            _createDrawerItem(
              icon: LineAwesomeIcons.money_bill,
              text: 'Gestion de la facturation',
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FacturationScreen.path);
              },
            ),
            _createDrawerItem(
                icon: LineAwesomeIcons.cash_register,
                text: 'Gestion financière',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FinanceScreen.path);
                }),
            _createDrawerItem(
                icon: LineAwesomeIcons.cash_register,
                text: 'Gestion Des Frais',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FinanceScreen.path);
                }),
            _createDrawerItem(
                icon: LineAwesomeIcons.cog,
                text: 'Paramètres',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ProfileScreen.path);
                }),
            const Divider(
              height: 2.0,
            ),
            _createDrawerItem(
                icon: LineAwesomeIcons.alternate_sign_out,
                text: 'Deconnecter',
                onTap: () {
// delete from sharred pref
                  Provider.of<FreelancerProvider>(context, listen: false)
                      .logout();
                  Navigator.of(context).pushReplacementNamed(SignInScreen.path);
                }),
          ],
        ),
      ),
    );
  }
}

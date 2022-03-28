/* import 'package:flutter/material.dart';
import 'package:portup/screens/HomeScreen.dart';
import 'package:portup/screens/FacurationScreen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../widgets/AppDrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const routeName = "tabs_screen";

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _screens = [
    {
      'title': 'Discover',
      'page': const DiscoverScreen(),
    },
    {
      'title': 'Gestion Rh',
      'page': const DiscoverScreen(),
    },
    {
      'title': 'MEs Documents',
      'page': const DiscoverScreen(),
    },
    {
      'title': 'Gestion Financier',
      'page': const DiscoverScreen(),
    },
    {
      'title': 'Profile',
      'page': const facturationScreen(),
    }
  ];
  int _selectedIndex = 1;
  void _selecScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
        actions: [
          if (_selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 25,
                  )),
            ),
        ],
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,

          onTap: _selecScreen,
          //backgroundColor: Colors.green,
          currentIndex: _selectedIndex,

          selectedItemColor: Theme.of(context).primaryColor,

          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Activity',
              //bar_chart_rounded
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: 'Docs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Facture',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
*/
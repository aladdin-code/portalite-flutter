import 'package:flutter/material.dart';
import 'package:portup/widgets/AppDrawer.dart';

class GestionFraisScreen extends StatefulWidget {
  static const path = "mes_frais";
  const GestionFraisScreen({Key? key}) : super(key: key);

  @override
  State<GestionFraisScreen> createState() => _GestionFraisScreenState();
}

class _GestionFraisScreenState extends State<GestionFraisScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Mes Frais',
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.8),
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        child: Text('Tous'),
                      ),
                      Tab(
                        child: Text('Notes de frais'),
                      ),
                      Tab(
                        child: Text('Forfait Repas'),
                      ),
                      Tab(
                        child: Text('Ticket Restaurant'),
                      ),
                      Tab(
                        child: Text('Frais kilometriques'),
                      ),
                      Tab(
                        child: Text('Grands deplacements'),
                      ),
                      Tab(
                        child: Text('Frais de Teletravail'),
                      )
                    ]),
                preferredSize: const Size.fromHeight(30.0)),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: const Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 6'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Tab 7'),
                ),
              ),
            ],
          )),
    );
  }
}

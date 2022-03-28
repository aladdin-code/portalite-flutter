import 'package:flutter/material.dart';
import 'package:portup/widgets/AppDrawer.dart';
import 'package:portup/widgets/MyProgressBar.dart';

class DocsScreen extends StatefulWidget {
  static const path = "my_documents";
  const DocsScreen({Key? key}) : super(key: key);

  @override
  _DocsScreenState createState() => _DocsScreenState();
}

class _DocsScreenState extends State<DocsScreen> {
  List<SizedBox> cards = [];
  List<Color> colors = [
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.lightBlueAccent
  ];
  int colorsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEs Documents"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 4.0,
            children: List.generate(cards.length, (index) {
              return Center(
                child: cards[index],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cards.add(SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Card(
                color: colors[colorsIndex],
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const SizedBox(height: 60),
                          const Text(
                            "File Name ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.5,
                            ),
                          ),
                          Text(
                            '02/08/2020',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w100,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ));
            if (colorsIndex < 4) {
              colorsIndex += 1;
            } else {
              colorsIndex = 0;
            }
          });
        },
        child: const Icon(Icons.add_to_drive),
      ),
    );
  }
}

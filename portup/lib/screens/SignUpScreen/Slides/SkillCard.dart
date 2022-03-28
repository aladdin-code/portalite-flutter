import 'package:flutter/material.dart';
import 'package:portup/screens/SignUpScreen/EducationForm.dart';
import 'package:portup/screens/SignUpScreen/WorkFormScreen.dart';
import '../../../models/Education.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({Key? key}) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool showEducation = false;
  bool showWork = false;
  List<Education> educations = [];
  List<Widget> educationWidgets = [];
  List<Work> works = [];
  List<Widget> worksWidgets = [];

  // Hobies

  List<String> hobbies = [];

  Column getHobbies() {
    List<Text> hobbiesWidgets = [];

    for (var hobbie in hobbies) {
      hobbiesWidgets.add(Text(hobbie));
    }

    return Column(
      children: [...hobbiesWidgets],
    );
  }

  Widget getEducations() {
    return Column(
      children: [
        const EducationForm(),
        const Divider(
          height: 5,
        ),
        ...educationWidgets
      ],
    );
  }

  Widget getWorks() {
    return Column(
      children: [
        const WorkFormScreen(),
        const SizedBox(
          height: 10,
        ),
        ...worksWidgets
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Education",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      // margin: const EdgeInsets.all(8.0),
                      // padding: const EdgeInsets.all(3.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showEducation = !showEducation;
                          });
                        },
                        icon: showEducation
                            ? const Icon(Icons.expand_less)
                            : const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    showEducation
                        ? getEducations()
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ],
            ),
          ),
          //  Work Experiences

          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Work Experiences",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      // margin: const EdgeInsets.all(8.0),
                      // padding: const EdgeInsets.all(3.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showWork = !showWork;
                            worksWidgets.add(const Text("Work Work"));
                          });
                        },
                        icon: showWork
                            ? const Icon(Icons.expand_less)
                            : const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    showWork
                        ? getWorks()
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// on tap + show create new widget
// on save
class Work {}

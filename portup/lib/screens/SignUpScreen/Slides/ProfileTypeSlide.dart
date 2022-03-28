import 'package:flutter/material.dart';

class ProfileTypeSlide extends StatefulWidget {
  const ProfileTypeSlide({Key? key}) : super(key: key);

  @override
  _ProfileTypeSlideState createState() => _ProfileTypeSlideState();
}

class _ProfileTypeSlideState extends State<ProfileTypeSlide> {
  int selectedTypeIndex = 1;
  Widget buildProfileTypeSelection() {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (selectedTypeIndex == 1) {
                  selectedTypeIndex = 0;
                } else {
                  selectedTypeIndex = 1;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(10)),
                color: (selectedTypeIndex == 0)
                    ? Theme.of(context).colorScheme.background
                    : Colors.grey[300],
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50.0,
              child: const Center(
                  child: Text(
                "Profile For an Organization",
              )),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (selectedTypeIndex == 0) {
                  selectedTypeIndex = 1;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: (selectedTypeIndex == 1)
                    ? Theme.of(context).colorScheme.background
                    : Colors.grey[300],
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50.0,
              child: const Center(
                child: Text(
                  "Profile For a Developper",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.login_outlined,
            size: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
            child: const Text(
              "Select Your Profile Type",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: const Text(
              "Please select The kind of profile you want to create",
              textAlign: TextAlign.center,
            ),
          ),
          buildProfileTypeSelection(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/Education.dart';

class EducationForm extends StatefulWidget {
  const EducationForm({Key? key}) : super(key: key);

  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  var hintText = '';
  List<Education> educations = [];
  // late String _startDate, _endDate;
  // final DateRangePickerController _controller = DateRangePickerController();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final educationEditingController = TextEditingController();
  final schoolEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  final discriptionEditingController = TextEditingController();

  _selectStartDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedStartDate) {
      setState(() {
        selectedStartDate = selected;
      });
    }
  }

  _selectEndDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedEndDate) {
      setState(() {
        selectedEndDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //first name field
    final educationField = TextFormField(
        autofocus: false,
        controller: educationEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Se champ ne doit  pas être vide");
          }

          return null;
        },
        onSaved: (value) {
          educationEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Education",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final schoolField = TextFormField(
        autofocus: false,
        controller: schoolEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("School ne Doit pas Etre vide");
          }
          return null;
        },
        onSaved: (value) {
          schoolEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "School",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final cityField = TextFormField(
        autofocus: false,
        controller: cityEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("City est obligatoire");
          }
          // reg expression for email validation

          return null;
        },
        onSaved: (value) {
          cityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field

    final discriptionField = TextFormField(
        keyboardType: TextInputType.multiline,
        autofocus: false,
        controller: discriptionEditingController,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Ce champ est obligatoire");
          }
        },
        onSaved: (value) {
          discriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Discription",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    return Card(
      child: Form(
          child: Column(
        children: [
          // title
          const SizedBox(height: 5),
          SizedBox(
            width: size.width * 0.9,
            height: 50,
            child: educationField,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.42,
                height: 50,
                child: schoolField,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              SizedBox(
                width: size.width * 0.42,
                height: 50,
                child: cityField,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          // Description
          const SizedBox(
            height: 10,
          ),

          SizedBox(
            width: size.width * 0.9,
            child: discriptionField,
          ),
          // date

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Start Date: ${selectedStartDate.day}/${selectedStartDate.month}/${selectedStartDate.year}"),
              OutlinedButton(
                onPressed: () {
                  _selectStartDate(context);
                },
                child: const Text("Select Start Date"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "End Date: ${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year} "),
              OutlinedButton(
                onPressed: () {
                  _selectEndDate(context);
                },
                child: const Text("Select End Date"),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _formKey.currentState?.reset();
                    educationEditingController.text = "";
                    cityEditingController.text = "";
                    schoolEditingController.text = "";
                    discriptionEditingController.text = "";
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  elevation: MaterialStateProperty.all(3),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label: const Text(
                  "Donne",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

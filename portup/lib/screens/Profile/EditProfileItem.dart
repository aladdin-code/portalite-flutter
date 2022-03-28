import 'package:flutter/material.dart';

class EditProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool readOnly;

  const EditProfileItem(
      {required Key key,
      required this.icon,
      required this.text,
      required this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ).copyWith(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color.fromRGBO(210, 225, 250, 0.35),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 35.0,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

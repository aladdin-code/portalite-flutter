import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../Constants/constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    required Key key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

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
          const SizedBox(width: 25.0),
          Text(
            text,
          ),
          const Spacer(),
          if (hasNavigation)
            const Icon(
              LineAwesomeIcons.angle_right,
              size: 25.0,
            ),
        ],
      ),
    );
  }
}

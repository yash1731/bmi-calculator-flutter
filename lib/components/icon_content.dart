import 'package:flutter/material.dart';
import '../constants.dart';

//! PASSING value of costom widget - icon widget and passing velue to string

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: KLabelTextStyle)
      ],
    );
  }
}

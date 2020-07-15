import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const iconSize = 80.0;

const spacing = 15.0;

class IconContent extends StatelessWidget {
  final String label;
  final IconData iconData;

  const IconContent({this.label, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: iconSize),
        SizedBox(
          height: spacing,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
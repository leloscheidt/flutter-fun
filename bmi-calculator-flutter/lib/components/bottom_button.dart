import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class BottomButton extends StatelessWidget {

  final Function onTap;
  final String label;

  BottomButton({@required this.onTap, @required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kCalculateButtonStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
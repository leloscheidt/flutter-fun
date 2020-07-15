import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
  int height = 180;
  int weight = 80;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      },
                      color: selected == Gender.male
                          ? kDefaultColor
                          : kInactiveColor,
                      cardChild: IconContent(
                        label: "MALE",
                        iconData: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.female;
                        });
                      },
                      color: selected == Gender.female
                          ? kDefaultColor
                          : kInactiveColor,
                      cardChild: IconContent(
                        label: "FEMALE",
                        iconData: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kDefaultColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextCardStyle,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: kBottomContainerColor.withAlpha(0x29),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kDefaultColor,
                      cardChild: ScoreCard(
                        label: 'WEIGHT',
                        value: weight.toString(),
                        onTapPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onTapMinus: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kDefaultColor,
                      cardChild: ScoreCard(
                        label: 'AGE',
                        value: age.toString(),
                        onTapPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                        onTapMinus: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {

                Calculator calc = Calculator(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculate(),
                      body: calc.getBody(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
              label: 'CALCULATE',
            ),
          ],
        ));
  }
}

class ScoreCard extends StatelessWidget {
  final String label;
  final String value;
  final Function onTapMinus;
  final Function onTapPlus;

  ScoreCard({this.label, this.onTapMinus, this.value, this.onTapPlus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value,
          style: kTextCardStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onTapMinus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onTapPlus,
            ),
          ],
        ),
      ],
    );
  }
}

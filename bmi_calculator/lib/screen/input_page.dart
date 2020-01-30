import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_items.dart';
import '../components/reusable_widget.dart';
import '../constants.dart';
import '../components/round_circular_button.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../calculate_brain.dart';
enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectgender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableWidget(
                onPress: () {
                  setState(() {
                    selectgender = Gender.MALE;
                  });
                },
                colour: (selectgender == Gender.MALE)
                    ? kActiveCardColor
                    : kInactiveCardColor,
                child: Icon_Items(
                  iconData: FontAwesomeIcons.mars,
                  textName: "MALE",
                ),
              )),
              Expanded(
                  child: ReusableWidget(
                onPress: () {
                  setState(() {
                    selectgender = Gender.FEMALE;
                  });
                },
                colour: (selectgender == Gender.FEMALE)
                    ? kActiveCardColor
                    : kInactiveCardColor,
                child: Icon_Items(
                  iconData: FontAwesomeIcons.venus,
                  textName: "FEMALE",
                ),
              )),
            ],
          )),
          Expanded(
            flex: 2,
              child: ReusableWidget(
              
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberLabelTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555)),
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
            colour: kActiveCardColor,
          )),
          Expanded(
            flex: 2,
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Weight",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundCircularButton(
                          icon: FontAwesomeIcons.minus,
                          onpress: () {
                            setState(() {
                              if (weight > 0) weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundCircularButton(
                          icon: FontAwesomeIcons.plus,
                          onpress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                colour: kActiveCardColor,
              )),
              Expanded(
                  child: ReusableWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Age",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundCircularButton(
                          icon: FontAwesomeIcons.minus,
                          onpress: () {
                            setState(() {
                              if (age > 0) age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundCircularButton(
                          icon: FontAwesomeIcons.plus,
                          onpress: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                colour: kActiveCardColor,
              )),
            ],
          )),
          Expanded(
              child: BottomButton(
              buttonText: "CALCULATE BMI ",
              onPressed: () {
                CalculateBrain calc = CalculateBrain(height: height,weight: weight,age: age);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(
                      resultBodyIndexMass: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      resultInterpretation: calc.getInterpretation(),
                      )
                      ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

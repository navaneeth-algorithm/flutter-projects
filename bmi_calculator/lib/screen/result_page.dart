import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_widget.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final resultBodyIndexMass;
  final resultText;
  final resultInterpretation;

  ResultPage({@required this.resultBodyIndexMass,@required this.resultText,@required this.resultInterpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: kResultLabelStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableWidget(
                  colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        resultBodyIndexMass,
                        style: kBMITextStyle,
                      ),
                      Text(
                        resultInterpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
            BottomButton(
              buttonText: "Re-Calculate Your BMI",
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}

import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_Button.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = KInactiveCardColour;
  Color femaleCardColour = KInactiveCardColour;

  int height = 180;
  int weight = 60;
  int age = 17;
  Gender selectedGender;

// 1 = male, 2 = female
  // void updateColour(Gender selectedGender) {
  //   // male card pressed
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   // female card got pressed
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                wordSpacing: 9.0,
                letterSpacing: 1.0),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(

                    //  child: GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           selectedGender = Gender.male;
                    //         });

                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? KActiveCardColor
                      : KInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? KActiveCardColor
                        : KInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: KnumberStyle),
                      Text(
                        ' cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: Colors.white,
                        // activeColor: Color(0xFFEB1555),

                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: KnumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          // FloatingActionButton(
                          //   backgroundColor: Color(0xFF4C4F5E),
                          //   child: Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          SizedBox(width: 10.0),
                          // FloatingActionButton(
                          //   backgroundColor: Color(0xFF4C4F5E),
                          //   child: Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // ),

                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: KLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KnumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}

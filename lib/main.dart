import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var inputUser = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: backgroundGreyDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          inputUser,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: textGreen,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          result,
                          textAlign: TextAlign.end,
                          style: TextStyle(color: textGrey, fontSize: 62),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getRow('ac', 'ce', '%', '/'),
                      getRow('7', '8', '9', '*'),
                      getRow('4', '5', '6', '-'),
                      getRow('1', '2', '3', '+'),
                      getRow('00', '0', '.', '='),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 0.0),
            ),
            backgroundColor: getColor(text1),
          ),
          onPressed: () {
            if (text1 == 'ac') {
              setState(() {
                inputUser = '';
                result = '';
              });
            } else {
              buttonPressed(text1);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text1)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 0.0),
            ),
            backgroundColor: getColor(text2),
          ),
          onPressed: () {
            if (text2 == 'ce' && inputUser.isNotEmpty) {
              setState(() {
                inputUser = inputUser.substring(0, inputUser.length - 1);
              });
            } else {
              buttonPressed(text2);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text2)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 0.0),
            ),
            backgroundColor: getColor(text3),
          ),
          onPressed: () {
            buttonPressed(text3);
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text3)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 0.0),
            ),
            backgroundColor: getColor(text4),
          ),
          onPressed: () {
            if (text4 == '=') {
              ShuntingYardParser parser = ShuntingYardParser();
              Expression expression = parser.parse(inputUser);

              RealEvaluator evaluator = RealEvaluator();
              double result1 = evaluator.evaluate(expression).toDouble();

              setState(() {
                result = result1.toString();
              });
            } else {
              buttonPressed(text4);
            }
          },

          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: getTextColor(text4)),
            ),
          ),
        ),
      ],
    );
  }

  bool isOperator(String text) {
    var list = ['+', '-', '*', '/', '=', '%', 'ac', 'ce'];
    if (list.contains(text)) {
      return true;
    } else {
      return false;
    }
  }

  Color getColor(String text) {
    if (isOperator(text)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getTextColor(String text) {
    if (isOperator(text)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }

  void buttonPressed(String text) {
    setState(() {
      inputUser += text;
    });
  }
}

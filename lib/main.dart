import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 3, child: Container(color: backgroundGreyDark)),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [getRow(), getRow(), getRow(), getRow()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '2',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '+',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
      ],
    );
  }
}

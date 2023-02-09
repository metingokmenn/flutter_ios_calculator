import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator_button.dart';
import 'package:flutter_calculator/widgets/calculator_screen.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String number;

  @override
  void initState() {
    number = '';
    super.initState();
  }

  final buttons = [
    'AC',
    '+/-',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '',
    ',',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalculatorScreen(
            number: number,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CalculatorButton(
                    buttonText: number.isEmpty ? 'AC' : 'C',
                    onButtonPressed: () {
                      setState(() {
                        number = '';
                      });
                    },
                  );
                } else if (index == 1) {
                  return CalculatorButton(
                    buttonText: buttons[index],
                    onButtonPressed: (() {
                      if (number.isNotEmpty) {
                        if (number.characters.first == '-') {
                          setState(() {
                            number = number.replaceAll(RegExp('-'), '');
                          });
                          debugPrint(number);
                        } else if (number.characters.first != '-') {
                          setState(() {
                            number =
                                StringUtils.addCharAtPosition(number, '-', 0);
                          });

                          debugPrint(number);
                        }
                      }
                    }),
                  );
                } else if (index == 2) {
                  return CalculatorButton(
                    buttonText: buttons[index],
                    onButtonPressed: (() {
                      if (number.isNotEmpty) {
                        setState(() {
                          number = (int.parse(number) / 100).toString();
                        });
                      }
                    }),
                  );
                } else if (index == 3) {
                  return CalculatorButton(
                      buttonText: buttons[index],
                      onButtonPressed: (() {
                        setState(() {
                          number += '/';
                        });
                      }));
                } else if (index == 7) {
                  return CalculatorButton(
                      buttonText: buttons[index],
                      onButtonPressed: (() {
                        setState(() {
                          number += 'X';
                        });
                      }));
                } else if (index == 11) {
                  return CalculatorButton(
                      buttonText: buttons[index],
                      onButtonPressed: (() {
                        setState(() {
                          number += '-';
                        });
                      }));
                } else if (index == 15) {
                  return CalculatorButton(
                      buttonText: buttons[index],
                      onButtonPressed: (() {
                        setState(() {
                          number += '+';
                        });
                      }));
                } else if (index == 19) {
                  return CalculatorButton(
                      buttonText: buttons[index], onButtonPressed: equalButton);
                } else {
                  return CalculatorButton(
                    buttonText: buttons[index],
                    onButtonPressed: () {
                      setState(() {
                        number += buttons[index];
                      });
                    },
                  );
                }
              },
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15, crossAxisSpacing: 15, crossAxisCount: 4),
            ),
          )
        ],
      ),
    );
  }

  void equalButton() {
    String finaluserinput = number;
    finaluserinput = number.replaceAll('X', '*');

    Expression exp = Parser().parse(finaluserinput);
    double eval = exp.evaluate(EvaluationType.REAL, ContextModel());

    setState(() {
      number = removeDecimalZeroFormat(eval);
    });
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}

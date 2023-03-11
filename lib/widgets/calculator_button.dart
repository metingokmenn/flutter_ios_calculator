import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final String? mode;
  final void Function() onButtonPressed;
  final ButtonStyle? buttonStyle;

  const CalculatorButton(
      {super.key,
      required this.buttonText,
      this.buttonStyle,
      required this.onButtonPressed,
      this.mode});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ElevatedButton(
          style: buttonStyle ??
              ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: isOperator()
                      ? MaterialStateProperty.all(Colors.orange)
                      : isSpecial()
                          ? MaterialStateProperty.all(Colors.grey)
                          : MaterialStateProperty.all(
                              const Color.fromARGB(255, 44, 44, 44))),
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: isSpecial() ? Colors.black : Colors.white),
          ),
        ));
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: onButtonPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          alignment: Alignment.center,
          color: isOperator()
              ? Colors.orange
              : isSpecial()
                  ? Colors.grey
                  : const Color.fromARGB(255, 31, 31, 31),
          child: Text(
            buttonText,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: isSpecial() ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }

  bool isOperator() {
    return (buttonText == '÷' ||
        buttonText == 'X' ||
        buttonText == '-' ||
        buttonText == '+' ||
        buttonText == '=');
  }

  bool isSpecial() {
    return (buttonText == 'AC' ||
        buttonText == 'C' ||
        buttonText == '+/-' ||
        buttonText == '%');
  }
}

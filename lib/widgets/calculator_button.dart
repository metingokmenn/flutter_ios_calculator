import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final void Function() onButtonPressed;

  const CalculatorButton(
      {super.key, required this.buttonText, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
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

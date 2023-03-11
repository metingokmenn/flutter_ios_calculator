import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key, required this.number});

  String number;

  @override
  Widget build(BuildContext context) {
    String displayedNumber = placeDots();

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: AutoSizeText(
          displayedNumber,
          maxLines: 1,
          style: const TextStyle(
              color: Colors.white, fontSize: 100, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  String placeDots() {
    String displayedNumber = number;
    if (number.isNotEmpty && int.parse(number) > 100000000) {
      number = number.substring(0, 9);
    }
    if (displayedNumber.isNotEmpty && int.parse(displayedNumber) >= 100000000) {
      displayedNumber = StringUtils.addCharAtPosition(
          StringUtils.addCharAtPosition(number, '.', 6), '.', 3);
    } else if (displayedNumber.isNotEmpty &&
        int.parse(displayedNumber) >= 10000000) {
      displayedNumber = StringUtils.addCharAtPosition(
          StringUtils.addCharAtPosition(number, '.', 5), '.', 2);
    } else if (displayedNumber.isNotEmpty &&
        int.parse(displayedNumber) >= 1000000) {
      displayedNumber = StringUtils.addCharAtPosition(
          StringUtils.addCharAtPosition(number, '.', 4), '.', 1);
    } else if (displayedNumber.isNotEmpty &&
        int.parse(displayedNumber) >= 100000) {
      displayedNumber = StringUtils.addCharAtPosition(number, '.', 3);
    } else if (displayedNumber.isNotEmpty &&
        int.parse(displayedNumber) >= 10000) {
      displayedNumber = StringUtils.addCharAtPosition(number, '.', 2);
    } else if (displayedNumber.isNotEmpty &&
        int.parse(displayedNumber) >= 1000) {
      displayedNumber = StringUtils.addCharAtPosition(number, '.', 1);
    }
    return displayedNumber;
  }
}

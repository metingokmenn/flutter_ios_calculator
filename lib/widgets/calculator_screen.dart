import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key, required this.number});
  String number;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: AutoSizeText(
          number,
          maxLines: 1,
          style: const TextStyle(
              color: Colors.white, fontSize: 100, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

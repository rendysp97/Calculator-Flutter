import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function press;

  CalculatorButton({required this.text, this.color, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 65,
      height: 65,
      child: FlatButton(
        onPressed: () {
          press(text);
        },
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

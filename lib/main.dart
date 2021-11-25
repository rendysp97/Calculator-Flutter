import 'package:flutter/material.dart';
import 'calcButton.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String history = '';
  String current = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  String operat = '';

  void operators(String text) {
    if (operat == '+') {
      result = (numOne + numTwo).toStringAsFixed(0);
      history = numOne.toString() + operat.toString() + numTwo.toString();
    }

    if (operat == '-') {
      result = (numOne - numTwo).toStringAsFixed(0);
      history = numOne.toString() + operat.toString() + numTwo.toString();
    }
    if (operat == 'X') {
      result = (numOne * numTwo).toStringAsFixed(0);
      history = numOne.toString() + operat.toString() + numTwo.toString();
    }
    if (operat == '/') {
      result = (numOne / numTwo).toStringAsFixed(0);
      history = numOne.toString() + operat.toString() + numTwo.toString();
    }
  }

  void calculate(String text) {
    if (text == 'AC') {
      result = '0';
      current = '';
      numOne = 0;
      numTwo = 0;
      history = '';
    } else if (text == 'C') {
      result = '0';
      current = '';
      numOne = 0;
      numTwo = 0;
    } else if (text == '+' || text == '-' || text == 'X' || text == '/') {
      numOne = double.parse(current);
      result = '';
      operat = text;
    } else if (text == '=') {
      numTwo = double.parse(current);
      operators(operat);
    } else if (text == '+/-') {
      if (current[0] != '-') {
        result = '-' + current;
      } else {
        result = current.substring(1);
      }
    } else if (text == '⌫') {
      result = current.substring(0, current.length - 1);
      if (result == '') {
        result = '0';
      }
    } else {
      result = int.parse(current + text).toString();
    }

    setState(() {
      current = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(history, style: const TextStyle(fontSize: 30)),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  current,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: 'AC',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                    text: 'C', color: Colors.amber, press: calculate),
                CalculatorButton(
                  text: '⌫',
                  color: Colors.grey[350],
                  press: calculate,
                ),
                CalculatorButton(
                  text: '/',
                  color: Colors.grey[350],
                  press: calculate,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '9',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '8',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '7',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                    text: 'X', color: Colors.grey[350], press: calculate)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '6',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '5',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '4',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '-',
                  color: Colors.grey[350],
                  press: calculate,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '3',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '2',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                    text: '1', color: Colors.amber, press: calculate),
                CalculatorButton(
                  text: '+',
                  color: Colors.grey[350],
                  press: calculate,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '+/-',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '0',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '00',
                  color: Colors.amber,
                  press: calculate,
                ),
                CalculatorButton(
                  text: '=',
                  color: Colors.grey[350],
                  press: calculate,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

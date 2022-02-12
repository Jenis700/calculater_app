import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _history = '0';
  String _expression = '0';

  void buttonPress(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '0';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '0';
    });
  }

  void minus(String text) {
    setState(() {
      _expression = "- $_expression";
    });
  }

  void delet(String text) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  void onEqual(String text) {
    Expression exp = Parser().parse(_expression);
    setState(() {
      _history = _expression;
      _expression =
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
    });
  }

  dot(String text) {
    bool ex = _expression.contains(".");
    if (ex == false) {
      String dotvar = _expression + '.';
      _expression = dotvar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      _history,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.right,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: _expression,
                          focusedBorder: OutlineInputBorder(),
                        ),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        CalcButton(
                          text: "CE",
                          callback: allClear,
                          fillColor: Colors.grey,
                          textColor: Colors.black,
                        ),
                        CalcButton(
                          text: "DEL",
                          callback: delet,
                          textSize: 20,
                          fillColor: Colors.grey,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcButton(
                          text: "AC",
                          callback: clear,
                          fillColor: Colors.grey,
                          textColor: Colors.black,
                        ),
                        CalcButton(
                          text: "+/-",
                          callback: minus,
                          fillColor: Colors.grey,
                          textColor: Colors.black,
                        ),
                        CalcButton(
                          text: "%",
                          callback: buttonPress,
                          fillColor: Colors.grey,
                          textColor: Colors.black,
                        ),
                        CalcButton(
                          text: "/",
                          callback: buttonPress,
                          fillColor: Colors.amber.shade900,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcButton(
                          text: "7",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "8",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "9",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "*",
                          callback: buttonPress,
                          fillColor: Colors.amber.shade900,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcButton(
                          text: "4",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "5",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "6",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "-",
                          callback: buttonPress,
                          fillColor: Colors.amber.shade900,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcButton(
                          text: "1",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "2",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "3",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "+",
                          callback: buttonPress,
                          fillColor: Colors.amber.shade900,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcButton(
                          text: "0",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "00",
                          callback: buttonPress,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: ".",
                          callback: dot,
                          fillColor: Colors.grey.withOpacity(0.5),
                        ),
                        CalcButton(
                          text: "=",
                          callback: onEqual,
                          fillColor: Colors.amber.shade900,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

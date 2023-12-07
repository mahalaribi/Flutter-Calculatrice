import 'dart:js_util';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_revision/calculetrice/buttons.dart';

class calc extends StatefulWidget {
  const calc({super.key});

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  var userquestion = '';
  var useranswer = '';
  final List<String> buttons = [
    'c',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        // appBar: AppBar(
        //   title: Text("calculatrice"),
        //   leading: Icon(Icons.calculate),
        // ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      userquestion,
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: EdgeInsets.only(left: 5.0),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      useranswer,
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: EdgeInsets.only(right: 5.0),
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4
                        ),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return myButtons(
                          buttonTapped: () {
                            setState(() {
                              userquestion = '';
                              useranswer='';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      } else if (index == 1) {
                        return myButtons(
                          buttonTapped: () {
                            setState(() {
                              userquestion = userquestion.substring(
                                  0, userquestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 1) {
                        return myButtons(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      } else {
                        return myButtons(
                            buttonTapped: () {
                              setState(() {
                                userquestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.black);
                      }
                    },
                  ),
                )),
          ],
        ));
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == '*') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalquestion=userquestion;
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
  useranswer=eval.toString();
    
  }
}


import 'package:flutter/material.dart';
import 'package:my_calculater/globals/globals.dart' as globals;
import 'MyButton.dart';
import 'package:math_expressions/math_expressions.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    List buttons = [
      'C',
      'DEL',
      '%',
      '÷',
      '7',
      '8',
      '9',
      '×',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      'ANS',
      '=',
    ];

    return GridView.builder(
      itemCount: buttons.length,
      itemBuilder: (BuildContext context, int index) {
        String currentButton = buttons[index];
        if (index == 0) {
          return MyButton(
            Colors.white,
            const LinearGradient(
              colors: <Color>[
                Color(0xFF008000),
                Color(0xFF00BC00),
                Color(0xFF4DCA4D),
              ],
            ),
            currentButton,
            () {
              setState(() {
                globals.userQuestion='';
                globals.userAnswer ='';
              });
            },
          );
        } else if (index == 1) {
          return MyButton(
            Colors.white,
            const LinearGradient(
              colors: <Color>[
                Color(0xFF960000),
                Color(0xFFEA1111),
                Color(0xFFFF3939),
              ],
            ),
            currentButton,
            () {
              setState(() =>
                globals.userQuestion=globals.userQuestion
                    .substring(0,globals.userQuestion.length-1));

            },
          );
        }

        else {
          return MyButton(
            _isOperator(currentButton) ? Colors.white : Colors.black,
            _getButtonColor(currentButton),
            currentButton,
            () {
              setState(() {
                equal(index,buttons);
                if(_isStartWithOperator()){
                  // globals.userQuestion =
                  //     'can\'t start with operator';
                  print(globals.userQuestion);
                }else{
                  globals.userQuestion =globals.userQuestion
                  +
                  buttons[index];

                }


              });
            },
          );
        }
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 1.0),
    );
  }
}

bool _isStartWithOperator(){
  String currentOperator= globals.userQuestion.toString();
  if(
  currentOperator.startsWith('=')||
  currentOperator.startsWith('×')||
  currentOperator.startsWith('÷')||
  currentOperator.startsWith('+')||
  currentOperator.startsWith('-')||
  currentOperator.startsWith('%')||
  currentOperator.startsWith('ANS')||
  currentOperator.startsWith('.')
  ){
    return true;
  }
  return false;
}

bool _isOperator(String symbol) {
  if (symbol == '+' ||
      symbol == '-' ||
      symbol == '×' ||
      symbol == '÷' ||
      symbol == '=' ||
      symbol == '%') {
    return true;
  }
  return false;
}

Gradient _getButtonColor(String currentButton) {
  if (_isOperator(currentButton)) {
    return const LinearGradient(
      colors: <Color>[
        Color(0xff590d22),
        Color(0xFF800f2f),
        Color(0xffb31843),
      ],
    );
  } else {
    return const LinearGradient(
      colors: <Color>[
        Color(0xFFff4d6d),
        Color(0xfff8647e),
        Color(0xfff298a8),
      ],
    );
  }
}

equal(int index,List buttons){
  print('index : $index');
  print('length ${buttons.length - 1}');
  globals.userQuestion.replaceAll('×', '*');
  if(index==buttons.length-1){

    Parser p = Parser();
    Expression exp = p.parse(globals.userQuestion);

    // Bind variables:
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    globals.userAnswer=eval.toString();
  }
}

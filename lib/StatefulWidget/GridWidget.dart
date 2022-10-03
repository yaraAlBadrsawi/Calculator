import 'package:flutter/material.dart';
import 'package:my_calculater/globals/staticVar.dart';
import '../globals/globals.dart' as globals;
import 'MyButton.dart';

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
                StaticVar.userQuestion += buttons[index];
                print(StaticVar.userQuestion);

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
              setState(() {
                StaticVar.userQuestion += buttons[index];                print(StaticVar.userQuestion);
                print(StaticVar.userQuestion);

              });
            },
          );
        } else {
          return MyButton(
            _isOperator(currentButton) ? Colors.white : Colors.black,
            _getButtonColor(currentButton),
            currentButton,
            () {
              setState(() {
                StaticVar.userQuestion = StaticVar.userQuestion+buttons[index];
                print(StaticVar.userQuestion);
              });
            },
          );
        }
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 9.0, mainAxisSpacing: 8.0),
    );
  }
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

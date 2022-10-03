import 'package:flutter/material.dart';
import 'package:my_calculater/MyButton.dart';

import 'globals.dart' as globals;

void main() {
  globals.userQuestion = '';
  globals.userAnswer = '';
  globals.nightMode = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globals.nightMode ? _lightThem : _darkThem,
      home: Button(),
    );
  }
}

ThemeData _lightThem = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

ThemeData _darkThem = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return _getMainContainer();
  }
}

Widget _getMainContainer() {
  return Scaffold(
    body: Column(
      children: [
        //  SwitchWidget(),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                  padding: EdgeInsets.all(22),
                  alignment: Alignment.centerLeft,
                  child: Text(globals.userQuestion,style: TextStyle(fontSize: 20),)),
              Container(
                  padding: EdgeInsets.all(22),
                  alignment: Alignment.centerRight,
                  child: Text(globals.userAnswer,style: TextStyle(fontSize: 20),)),
            ],
          ),
        )),
        Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(28),
              child: _getGrid(),
            )),
      ],
    ),
  );
}

Widget _getGrid() {
  List buttons = [
    'c',
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
            currentButton);
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
            currentButton);
      } else {
        return MyButton(
            _isOperator(currentButton) ? Colors.white : Colors.black,
            _getButtonColor(currentButton),
            currentButton);
      }
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, crossAxisSpacing: 9.0, mainAxisSpacing: 8.0),
  );
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

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: globals.nightMode,
        onChanged: (var value) {
          setState(() {
            print(value);
            globals.nightMode = value;
            globals.changeColor = !globals.changeColor;
            print(globals.changeColor);

            // if(value){
            //   globals.backgroundColor=Colors.black;
            // }else
            //   globals.backgroundColor=Colors.white;
          });
        });
  }
}

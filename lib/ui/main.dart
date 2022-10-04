import 'package:flutter/material.dart';
import 'package:my_calculater/StatefulWidget/GridWidget.dart';
import 'package:my_calculater/StatefulWidget/SwitchWidget.dart';
import 'package:my_calculater/globals/globals.dart' as globals;

import '../globals/staticVar.dart';

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
      theme: globals.nightMode ?  _darkThem:_lightThem,
      home: Button(),
    );
  }
}

ThemeData _lightThem = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkThem = ThemeData(
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
                height: 20,
              ),
              Container(
                color: Color(0xff4d4d4d).withOpacity(0.5),
                padding:const EdgeInsets.only(top:10,right: 15,left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    globals.userQuestion,
                    style: const TextStyle(fontSize: 30,color: Colors.white),
                  ),
              ),
              Container(
                color: Color(0xff4d4d4d).withOpacity(0.5),
                height:60,
                padding: const EdgeInsets.only(right: 15,left: 15),
                alignment: Alignment.centerRight,
                child: Text(
                 globals.userAnswer,
                  style:const TextStyle(fontSize: 30,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        ),
        Container(
          alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 16),
            child: const SwitchWidget()),
        Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _getGrid(),
            )),
      ],
    ),
  );
}

Widget _getGrid() {
  return const GridWidget();
}

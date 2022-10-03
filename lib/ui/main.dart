import 'package:flutter/material.dart';
import 'package:my_calculater/StatefulWidget/GridWidget.dart';
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
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StaticVar.userQuestion ,
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  )),
              Container(
                  padding: EdgeInsets.all(22),
                  alignment: Alignment.centerRight,
                  // child: Text(
                  //   StaticVar.userAnswer ,
                  //   style: TextStyle(fontSize: 20,color: Colors.white),
                  // ),
              ),
            ],
          ),
        )),
        Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: _getGrid(),
            )),
      ],
    ),
  );
}

Widget _getGrid() {
  return const GridWidget();
}

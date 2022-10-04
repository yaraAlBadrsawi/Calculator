import 'package:flutter/material.dart';
import 'package:my_calculater/globals/globals.dart' as globals;

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.pinkAccent,
        value: globals.nightMode,
        onChanged: (var value) {
          setState(() {
            print(value);
            globals.nightMode = value;
            globals.changeColor = !globals.changeColor;
            print(globals.changeColor);

          });
        });
  }
}

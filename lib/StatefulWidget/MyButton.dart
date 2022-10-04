import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? textColor;
  final Gradient buttonColor;
  final String? text;
  final buttonTapped;

  MyButton(this.textColor, this.buttonColor, this.text,this.buttonTapped);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Container(
        decoration: BoxDecoration(
            gradient: buttonColor),
        child: MaterialButton(
          onPressed: buttonTapped,
          splashColor: Colors.white.withOpacity(0.5),
          child: Text(
            text!,
            style: TextStyle(fontSize: 18, color: textColor!),
          ),
        ),
      ),
    );
  }
}

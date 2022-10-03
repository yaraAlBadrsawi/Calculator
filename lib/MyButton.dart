import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? textColor;
  final Gradient buttonColor;
  final String? text;

  MyButton(this.textColor, this.buttonColor, this.text);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(35)),
      child: Container(

        decoration: BoxDecoration(gradient: buttonColor),
        child: MaterialButton(
          onPressed: () {},
          splashColor: Colors.white.withOpacity(0.3),
          child: Text(
            text!,
            style: TextStyle(fontSize: 17, color: textColor!),
          ),
        ),
      ),
    );
  }
}

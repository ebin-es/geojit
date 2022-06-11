import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color? bgColor;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      enableFeedback: true,
      padding: EdgeInsets.zero,
      onPressed: () {
        onPressed();
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

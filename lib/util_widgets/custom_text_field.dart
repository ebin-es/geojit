import 'package:flutter/material.dart';
import '../themes/text_styles.dart';
import '../themes/theme_data.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  String hintText;
  Function onChanged;
  Color? bgColor;
  TextEditingController textController;
  TextInputType inputType;
  bool obscureText;
  int maxLength;
  IconButton prefixIcon;
  IconButton suffixIcon;

  CustomTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.textController,
    this.hintText = '',
    this.inputType = TextInputType.text,
    this.bgColor = Colors.green,
    this.obscureText = false,
    this.maxLength = 30,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        border: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: (text) {
        onChanged(text);
      },
      keyboardType: inputType,
      obscureText: obscureText,
      maxLength: maxLength,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}

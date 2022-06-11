import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  String errText;

  ErrorDisplayWidget({
    Key? key,
    this.errText = "Something went wrong!",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Column(
        children: [
      const Icon(
        Icons.error_outline,
        color: Colors.redAccent,
        size: 63,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          errText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget{
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(),
    );
  }

}
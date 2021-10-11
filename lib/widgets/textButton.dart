import 'package:flutter/material.dart';

Color basicColor=Color(0xFF00C569);

class textButton extends StatelessWidget {
  final Color? buttonColor;
  final  onPressed;
  final Widget? childy;
  textButton({this.buttonColor,this.onPressed,this.childy});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(buttonColor),
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      onPressed: onPressed,

      child: childy!,
    );
  }
}

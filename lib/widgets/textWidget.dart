import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final Color? textColor;
  final String? textContent;
  final double? textSize;
  final weight;
  final alignMethode;
  TextWidget({this.textColor,this.textContent,this.textSize,this.weight,this.alignMethode});

  @override
  Widget build(BuildContext context) {
    return Text(textContent!,
      textAlign: alignMethode,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontFamily: 'NotoSans',
        fontWeight: weight,
      ),);
  }
}
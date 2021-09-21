import 'package:flutter/material.dart';

Color basicColor=Color(0xFF00C569);

class DoWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? childy;
  final double? paddingValue;
  final double? h;
  DoWidget({this.backgroundColor,this.childy,this.paddingValue,this.h});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: h,
        padding: EdgeInsets.all(paddingValue!),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero,
              blurRadius: 0.7,
            ),],
        ),
        child: childy);
  }
}

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
import 'package:flutter/material.dart';

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
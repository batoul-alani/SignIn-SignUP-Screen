import 'package:ecommerancy/services/getSizes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerancy/widgets/textWidget.dart';

class ButtonRow extends StatelessWidget {
  final IconData buttonIcon;
  final String buttonName;
  ButtonRow(this.buttonIcon,this.buttonName);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          buttonIcon,
          color: Colors.black54,
          size: displyHeight(context) *0.03,
        ),
        SizedBox(
          width: displyWidth(context) * 0.10,
        ),
        TextWidget(
          textSize: displyHeight(context) *0.03,
          textContent: buttonName,
          textColor: Colors.black54,
        )
      ],
    );
  }
}

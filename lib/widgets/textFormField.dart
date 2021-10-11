import 'package:flutter/material.dart';
import 'textButton.dart';

class TextForm extends StatelessWidget {
  final String? Function(String?)? validatorFunction;
  final void Function(String)? onChanged;
  final bool obscureValue;
  final String? label;
  final TextInputType? inputType;

  TextForm({required this.validatorFunction,required this.label,required this.obscureValue,required this.inputType,required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureValue,
      keyboardType: inputType,
      autofocus: true,
      cursorColor: basicColor,
      validator: validatorFunction,
      decoration: InputDecoration(fillColor: basicColor,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: basicColor,),
        ),),
      onChanged: onChanged,
    );
  }
}

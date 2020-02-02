import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final Icon inputFieldIcon;
  final TextEditingController controller;
  final TextInputType texttype;
  final bool encodeCharacter;

  InputFieldWidget(
      {this.inputFieldIcon,
      this.hintText,
      this.controller,
      this.texttype,
      this.encodeCharacter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      keyboardType: this.texttype,
      obscureText: this.encodeCharacter,
      decoration:
          InputDecoration(icon: this.inputFieldIcon, hintText: this.hintText),
    );
  }
}